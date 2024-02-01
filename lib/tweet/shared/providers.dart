import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';
import 'package:twitter_clone_2/tweet/application/single_tweet_notifier.dart';
import 'package:twitter_clone_2/tweet/application/tweet_comment_notifier.dart';
import 'package:twitter_clone_2/tweet/application/tweet_controller.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/comment/comment_state.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_list_state.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

final tweetControllerProvider =
    StateNotifierProvider<TweetController, TweetListState>((ref) {
  // final userId = ref.watch(firebaseAuthProvider).currentUser?.uid ?? '';
  // debugPrint('currentUserId: $userId');
  // final currentUser = ref.watch(userDetail(userId)).value;
  return TweetController(ref.watch(tweetRepositoryProvider), ref);
});

final getTweettDetailProvider =
    FutureProvider.autoDispose.family<Tweet?, String>((ref, tweetId) async {
  final response =
      await ref.watch(tweetRepositoryProvider).getSingleTweet(tweetId);
  return response;
});

final singleTweetControllerProvider = StateNotifierProvider.autoDispose
    .family<SingleTweetNotifier, Tweet?, String>((ref, tweetId) {
  return SingleTweetNotifier(
      ref.watch(getTweettDetailProvider(tweetId)).valueOrNull,
      ref.watch(tweetRepositoryProvider),
      ref.watch(notificationNotifierProvider.notifier));
});

final commentTweetProvider =
    StateNotifierProvider<TweetCommentNotifier, CommentState>((ref) {
  return TweetCommentNotifier(ref.watch(tweetRepositoryProvider),
      ref.watch(notificationNotifierProvider.notifier));
});
