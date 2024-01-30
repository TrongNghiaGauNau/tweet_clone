import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/core/presentation/common/error_page.dart';
import 'package:twitter_clone_2/core/presentation/common/loading_page.dart';
import 'package:twitter_clone_2/search/infrastructure/models/search_state.dart';
import 'package:twitter_clone_2/search/presentation/widgets/search_tile.dart';
import 'package:twitter_clone_2/search/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final appBarTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Pallete.searchBarColor),
    );

    final searchController =
        useTextEditingController(text: ref.read(searchKeyProvider));
    final searchStream = useStreamController<String>(keys: []);

    useEffect(() {
      final subStream = searchStream.stream.listen((text) {
        if (text.isNotEmpty) {
          ref.read(searchProvider.notifier).searchUser(text);
        }
      });
      return () {
        subStream.cancel();
        searchStream.sink.close();
      };
    }, [searchStream]);

    final emptyQuery = useListenableSelector(
      searchController,
      () => searchController.text.isEmpty,
    );

    ref.listen<String>(searchKeyProvider, (prev, text) {
      // keep the state of search keyword, prevent auto-dispose
      // this stream is used for trigger search notifiers whenever there is a new keyword
      searchStream.add(text);
    });

    ref.listen<SearchState>(searchProvider, (_, next) {
      next.maybeWhen(
        orElse: () {},
        error: (failure, data) {
          debugPrint(failure.messsage);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: searchController,
            // onSubmitted: (value) {
            //   ref.read(searchProvider.notifier).searchUser(value);
            // },
            onChanged: (value) =>
                ref.read(searchKeyProvider.notifier).state = value,
            autocorrect: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10).copyWith(left: 20),
              fillColor: Pallete.searchBarColor,
              filled: true,
              enabledBorder: appBarTextFieldBorder,
              focusedBorder: appBarTextFieldBorder,
              hintText: 'Search Twitter',
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => ref
                .read(searchProvider.notifier)
                .searchUser(searchController.text),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      body: emptyQuery
          ? const Center(child: Text('Search something'))
          : const SearchResults(),
    );
  }
}

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    return search.when(
      init: () => const Center(child: Text('Search something')),
      data: (userList) {
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return SearchTile(user: user);
          },
        );
      },
      error: (failure, data) => ErrorText(error: failure.messsage),
      empty: () => const Center(
          child: Text('Can find anything matched. Search for something else')),
      loading: () => const Loader(),
    );
  }
}
