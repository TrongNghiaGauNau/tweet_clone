import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/comment/comment.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:uuid/uuid.dart';

class TweetRepository {
  final _tweetRepo = FirebaseFirestore.instance.collection('tweets');
  final _commentRepo = FirebaseFirestore.instance.collection('comments');

  Future<Either<Failure, Tweet>> shareTweet(Tweet tweet) async {
    try {
      await _tweetRepo.doc(tweet.id).set(tweet.toJson());
      return right(tweet);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'tweet_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<void> updateReshareAccount(Tweet tweet) async {
    try {
      _tweetRepo.doc(tweet.id).update({'reshareCount': tweet.reshareCount});
      return right(null);
    } on FirebaseException catch (e, st) {
      debugPrint('tweet_api: ${e.message ?? 'Some unexpected error occured'}');
      return left(Failure(e.message ?? 'Some unexpected error occured', st));
    } catch (e, st) {
      debugPrint('tweet_api: ${e.toString()}');
      return left(Failure(e.toString(), st));
    }
  }

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];
    List<UploadTask> tasks = [];

    const uuid = Uuid();
    for (final image in images) {
      try {
        final uniqueId = uuid.v4();
        final storageRef =
            FirebaseStorage.instance.ref().child('images/$uniqueId');
        final uploadTask = storageRef.putFile(image);
        tasks.add(uploadTask);
      } catch (e) {
        debugPrint("Error uploading image ${image.path}: $e");
      }
    }

    try {
      await Future.wait(tasks); // Wait for all uploads to finish
      for (var task in tasks) {
        final snapshot = await task;
        imageUrls.add(await snapshot.ref.getDownloadURL());
      }
    } catch (e) {
      debugPrint("Error uploading images: $e");
    }

    return imageUrls;
  }

  Future<String> uploadImage(File image) async {
    List<String> imageUrl = [];
    List<UploadTask> tasks = [];

    const uuid = Uuid();

    try {
      final uniqueId = uuid.v4();
      final storageRef =
          FirebaseStorage.instance.ref().child('images/$uniqueId');
      final uploadTask = storageRef.putFile(image);
      tasks.add(uploadTask);
      await Future.wait(tasks); // Wait for all uploads to finish
      for (var task in tasks) {
        final snapshot = await task;
        imageUrl.add(await snapshot.ref.getDownloadURL());
      }
    } catch (e) {
      debugPrint("Error uploading image ${image.path}: $e");
    }

    return imageUrl[0];
  }

  Future<List<Tweet>> getTweets(List<String> followedUser) async {
    final documents = await _tweetRepo
        .where('tweetCreator.creator_uid', whereIn: followedUser)
        .orderBy('tweetedAt', descending: true)
        .get();
    final tweetsList =
        documents.docs.map((doc) => Tweet.fromJson(doc.data())).toList();
    return tweetsList;
  }

  Future<List<Tweet>> getTweetsByHashtag(String hashTag) async {
    final documents = await _tweetRepo
        .where('hashTags', arrayContains: hashTag)
        .orderBy('tweetedAt', descending: true)
        .get();
    final tweetsList =
        documents.docs.map((doc) => Tweet.fromJson(doc.data())).toList();
    return tweetsList;
  }

  Future<Tweet?> getSingleTweet(String tweetId) async {
    try {
      final singleTweet = await _tweetRepo.doc(tweetId).get();

      if (singleTweet.exists) {
        final data = singleTweet.data();
        return Tweet.fromJson(data!);
      } else {
        debugPrint('Can not get single tweet');
        return null;
      }
    } catch (error) {
      debugPrint('Can not get single tweet: $error');
      return null;
    }
  }

  FutureEitherVoid likeTweet(Tweet tweet) async {
    try {
      _tweetRepo.doc(tweet.id).update({'likes': tweet.likes});
      return right(null);
    } on FirebaseException catch (e, st) {
      debugPrint('tweet_api: ${e.message ?? 'Some unexpected error occured'}');
      return left(Failure(e.message ?? 'Some unexpected error occured', st));
    } catch (e, st) {
      debugPrint('tweet_api: ${e.toString()}');
      return left(Failure(e.toString(), st));
    }
  }

  FutureEither<Comment> sendComment(Comment comment, Tweet tweet) async {
    try {
      await _commentRepo.doc(comment.id).set(comment.toJson());
      await _tweetRepo.doc(tweet.id).update({'commentsIds': tweet.commentsIds});
      return right(comment);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'tweet_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<Comment>> getTweetComments(
      List<String> tweetCommentIds) async {
    try {
      final List<Comment> tweetComments = [];
      //get commments
      for (final tweetId in tweetCommentIds) {
        final result = await _commentRepo
            .where('id', isEqualTo: tweetId)
            .get()
            .then((value) => value.docs[0]);
        tweetComments.add(Comment.fromJson(result.data()));
      }

      return right(tweetComments);
    } catch (error, st) {
      debugPrint('Can not get tweet comment: $error');
      return left(Failure(e.toString(), st));
    }
  }

  Future<List<Tweet>> getUsersTweets(String uid) async {
    final documents = await _tweetRepo
        .where('tweetCreator.${TweetCreator.creatorUID}', isEqualTo: uid)
        .orderBy('tweetedAt', descending: true)
        .get();
    final tweetsList =
        documents.docs.map((doc) => Tweet.fromJson(doc.data())).toList();
    return tweetsList;
  }

  FutureEither<void> deleteTweet(String tweetId) async {
    try {
      final res = _tweetRepo.doc(tweetId).delete();

      return right(res);
    } catch (error, st) {
      debugPrint('Can not delete tweet: $error');
      return left(Failure(e.toString(), st));
    }
  }
}
