import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/attachments/shared/providers.dart';

const chatId = 'jxdupRbPtSZ6Y1HczNrgB1Yqe3q1_lftT6BADM8QUGP0b6xx5q4GwtNi1';

class TestScreen extends HookConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatImageList = ref.watch(chatImagesNotiferProvider);

    useEffect(() {
      Future(() =>
          ref.read(chatImagesNotiferProvider.notifier).getChatImages(chatId));
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(),
      body: chatImageList.when(
        init: () => const Center(child: Text('Images list is empty')),
        error: () =>
            const Center(child: Text('Can not show images due to some error')),
        empty: () =>
            const Center(child: Text('There is no images have been sent yet')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (imagesList) {
          // for (final image in imagesList) {
          //   debugPrint('$image \n');
          // }
          return GridView.builder(
            itemCount: imagesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  imagesList[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
