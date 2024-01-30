import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_card.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

class TweetList extends HookConsumerWidget {
  const TweetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweets = ref.watch(tweetControllerProvider);

    useEffect(() {
      Future(() async {
        ref.read(tweetControllerProvider.notifier).getTweets(ref);
      });
      return null;
    }, []);

    if (tweets.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (tweets.tweetsList.isEmpty) {
      return const Center(child: Text('There is no new tweet to show'));
    }
    return RefreshIndicator(
      onRefresh: () async {
        await ref.refresh(tweetControllerProvider.notifier).getTweets(ref);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        itemCount: tweets.tweetsList.length,
        itemBuilder: (context, index) {
          final tweet = tweets.tweetsList[index];
          return TweetCard(tweetData: tweet);
        },
      ),
    );
  }
}
