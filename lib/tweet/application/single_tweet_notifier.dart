import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';

class SingleTweetNotifier extends StateNotifier<Tweet?> {
  SingleTweetNotifier(this.tweet, this._repo) : super(tweet);
  final Tweet? tweet;
  final TweetRepository _repo;

  FutureVoid likeTweet(Tweet tweet, String uid) async {
    List<String> likes = [...tweet.likes];
    if (likes.contains(uid)) {
      likes.remove(uid);
    } else {
      likes.add(uid);
    }

    tweet = tweet.copyWith(likes: likes);

    final res = await _repo.likeTweet(tweet);
    res.fold((l) => debugPrint('Can not execute react!!'), (r) {
      // _notificationController.createNotification(
      //     text: '${user.name} like you tweet',
      //     postId: tweet.id,
      //     notificationType: NotificationType.like,
      //     uid: tweet.uid);
      state = state?.copyWith(likes: likes);
    });

    // final newState = [...state.tweetsList];
    // newState.add(tweet);
    // state = state.copyWith(tweetsList: newState);
  }

  void updatePost(Tweet newPost) {
    state = newPost;
  }

  void fetchPost() async {}

  void updateTotal() {}
}
