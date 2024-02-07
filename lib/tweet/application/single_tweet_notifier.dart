import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';
import 'package:twitter_clone_2/tweet/application/tweet_comment_notifier.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class SingleTweetNotifier extends StateNotifier<Tweet?> {
  SingleTweetNotifier(this.tweet, this._repo, this._notificationNotifier)
      : super(tweet);
  final Tweet? tweet;
  final TweetRepository _repo;
  final NotificationNotifier _notificationNotifier;

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
      _notificationNotifier.createNotification(
        text: ' like your tweet',
        postId: tweet.id,
        notificationType: NotificationType.like,
        receiverID: tweet.tweetCreator[TweetCreator.creatorUID]!,
        senderID: uid,
      );
    });

    // final newState = [...state.tweetsList];
    // newState.add(tweet);
    // state = state.copyWith(tweetsList: newState);
  }

  void updatePost(Tweet newPost) {
    state = newPost;
  }
}
