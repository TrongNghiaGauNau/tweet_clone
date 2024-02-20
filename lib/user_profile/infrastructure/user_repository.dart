import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart'
    as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';

class UserRepsitory {
  final _firebaseFirestore = FirebaseFirestore.instance.collection('users');
  final _userUIRepo = FirebaseFirestore.instance.collection('users_ui');
  final _tweetRepo = FirebaseFirestore.instance.collectionGroup('tweets');

  CollectionReference getAllUserDemo() {
    return _userUIRepo;
  }

  FutureEitherVoid saveUserData(model.User user, String uid) async {
    try {
      await _firebaseFirestore.doc(uid).set(user.toJson());
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEitherVoid saveUserUIData(UserUI user, String uid) async {
    try {
      await _userUIRepo.doc(uid).set(user.toJson());
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<model.User?> getUserData(String uid) async {
    final documents = await _firebaseFirestore.doc(uid).get();
    final userData = documents.data();
    if (userData != null) {
      final user = model.User.fromJson(userData);
      return user;
    }
    return null;
  }

  Future<UserUI?> getUserUIData(String uid) async {
    final documents = await _userUIRepo.doc(uid).get();
    final userData = documents.data();
    if (userData != null) {
      final user = UserUI.fromJson(userData);
      return user;
    }
    return null;
  }

  FutureEitherVoid followUser(
      {required model.User currentuser,
      required model.User followedUser}) async {
    try {
      //add or remove id of followed user to currentUser following list
      await _firebaseFirestore
          .doc(currentuser.uid)
          .update({'following': currentuser.following});
      //add or remove id of currentUser to followedUser followers list
      await _firebaseFirestore
          .doc(followedUser.uid)
          .update({'followers': followedUser.followers});
      return right(null);
    } on FirebaseException catch (e, st) {
      debugPrint('user_api: ${e.message ?? 'Some unexpected error occured'}');
      return left(Failure(e.message ?? 'Some unexpected error occured', st));
    } catch (e, st) {
      debugPrint('user_api: ${e.toString()}');
      return left(Failure(e.toString(), st));
    }
  }

  FutureEither<model.User> updateUserData(model.User user) async {
    try {
      //update user information
      await _firebaseFirestore.doc(user.uid).update(user.toJson());
      //update all tweet information this user post
      final userNewProfilePic = user.profilePic;
      final collectionRef =
          _tweetRepo.where('tweetCreator.creator_uid', isEqualTo: user.uid);
      await (collectionRef.get().then((snapshot) async {
        for (final doc in snapshot.docs) {
          final docReference = doc.reference;
          await docReference.update({
            'tweetCreator.${TweetCreator.creatorAvatar}': userNewProfilePic
          });
        }
      }));
      return right(user);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<void> updateUserUI(String uid, String profilePic,
      {bool isTwitterBlue = false}) async {
    try {
      //update user information
      await _userUIRepo
          .doc(uid)
          .update({'profilePic': profilePic, 'isTwitterBlue': isTwitterBlue});
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserOnlineInfo(String userId) {
    final stream =
        _firebaseFirestore.where('uid', isEqualTo: userId).snapshots();

    return stream;
  }

  FutureEither<void> updateActiveStatus(String userId, bool isOnline) async {
    try {
      //update user information
      final now = DateTime.now().toIso8601String();
      if (isOnline) {
        await _firebaseFirestore
            .doc(userId)
            .update({'isOnline': isOnline, 'lastActive': ''});
      } else {
        await _firebaseFirestore
            .doc(userId)
            .update({'isOnline': isOnline, 'lastActive': now});
      }

      //update all tweet information this user post
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
