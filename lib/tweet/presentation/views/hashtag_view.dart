import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_card.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

class HashTagView extends HookConsumerWidget {
  const HashTagView({super.key, required this.hashtag});

  final String hashtag;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweets = ref.watch(tweetControllerProvider
        .select((tweetState) => tweetState.tweetsListByHashtag));
    final isLoading = ref.watch(
        tweetControllerProvider.select((tweetState) => tweetState.isLoading));

    useEffect(() {
      Future(() async {
        ref.read(tweetControllerProvider.notifier).getTweetsByHashtag(hashtag);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(hashtag),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tweets.isEmpty
              ? const Center(
                  child: Text('There is no tweet match with hashtag'))
              : RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .refresh(tweetControllerProvider.notifier)
                        .getTweets(ref);
                    return Future.delayed(const Duration(seconds: 1));
                  },
                  child: ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (context, index) {
                      final tweet = tweets[index];
                      return TweetCard(tweetData: tweet);
                    },
                  ),
                ),
    );
  }
}
