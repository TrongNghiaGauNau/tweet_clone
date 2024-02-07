import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/comment/comment.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/comment/comment_state.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:uuid/uuid.dart';

class TweetCommentNotifier extends StateNotifier<CommentState> {
  TweetCommentNotifier(this._repo, this._notificationNotifier)
      : super(const CommentState());
  final TweetRepository _repo;
  final NotificationNotifier _notificationNotifier;

  // FutureVoid likeComment(Comment comment, String uid) async {
  //   List<String> likes = [...comment.likes ?? []];
  //   if (likes.contains(uid)) {
  //     likes.remove(uid);
  //   } else {
  //     likes.add(uid);
  //   }

  //   comment = comment.copyWith(likes: likes);
  //   final res = await _repo.likeComment(comment);
  //   res.fold((l) => debugPrint('Can not execute react!!'), (r) {
  //     // _notificationController.createNotification(
  //     //     text: '${user.name} like you tweet',
  //     //     postId: tweet.id,
  //     //     notificationType: NotificationType.like,
  //     //     uid: tweet.uid);
  //     state = state?.copyWith(likes: likes);
  //   });

  //   // final newState = [...state.tweetsList];
  //   // newState.add(tweet);
  //   // state = state.copyWith(tweetsList: newState);
  // }

  FutureEither<Tweet> sendComment(
      {required Tweet tweet,
      required List<File> images,
      required String text,
      required String uid,
      required String repliedTo}) async {
    final hashTags = getHashtagsFromText(text);
    final link = getLinkFromText(text);
    final id = const Uuid().v4();
    // final imageLinks = await _repo.uploadImages(images);
    final comment = Comment(
      text: text,
      hashTags: hashTags,
      link: link,
      imagesLink: [],
      uid: uid,
      createdAt: DateTime.now().toIso8601String(),
      likes: [],
      id: id,
      tweetId: tweet.id,
      repliedTo: repliedTo,
    );
    final commentsIds = [...tweet.commentsIds];
    commentsIds.add(id);
    tweet = tweet.copyWith(commentsIds: commentsIds);
    final fOs = await _repo.sendComment(comment, tweet);

    return fOs.fold(
      (l) => left(l),
      (r) {
        _notificationNotifier.createNotification(
          text: ' comment on your tweet',
          postId: tweet.id,
          notificationType: NotificationType.reply,
          receiverID: tweet.tweetCreator[TweetCreator.creatorUID]!,
          senderID: uid,
        );
        getTweetComments(tweet.id);
        return right(tweet);
      },
    );
  }

  FutureVoid getTweetComments(String tweetId) async {
    state = state.copyWith(isLoading: true);
    final tweetCommentsList = await _repo.getTweetComments(tweetId);
    tweetCommentsList.fold((l) => debugPrint('Can not get tweet comments'),
        (r) {
      // List<Comment> sortedComments = [...r.reversed];
      state = state.copyWith(tweetComments: r);
    });
    state = state.copyWith(isLoading: false);
  }

  // addNewCommentToList(Comment comment) {
  //   final cmtsList = state.tweetComments;
  //   final newData = List.of(cmtsList)..add(comment);
  //   state = state.copyWith(tweetComments: newData);
  // }
  // FutureEither<void> updateComment(
  //     {required int commentId, required String content}) async {
  //   final fOs =
  //       await _repo.updateComment(commentId: commentId, content: content);

  //   return fOs.fold(
  //     (l) => left(l),
  //     (r) {
  //       final itemIndex =
  //           state.currentData.indexWhere((cmt) => cmt.id == commentId);

  //       if (itemIndex != -1) {
  //         final editedComment = state.currentData[itemIndex];
  //         state = state.modifiedElement(
  //             editedComment.copyWith(content: content, isEdited: true));
  //       }
  //       return right(null);
  //     },
  //   );
  // }

  // FutureEither<void> deleteComment({required int commentId}) async {
  //   final fOs = await _repo.deleteCommnent(commentId: commentId);

  //   return fOs.fold(
  //     (l) => left(l),
  //     (r) {
  //       final itemIndex =
  //           state.currentData.indexWhere((cmt) => cmt.id == commentId);

  //       final deletedComment = state.currentData[itemIndex];

  //       state = state.modifiedElement(deletedComment.copyWith(
  //           content: 'このコメントは削除されました', isDeleted: true));
  //       return right(null);
  //     },
  //   );
  // }
}
