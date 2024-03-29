import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/auth/application/authenticator.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart'
    as model;
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_profile_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

class UserProfileController extends StateNotifier<UserProfileState> {
  //state user cần có : thong tin user(name,avatar,isBlue,follower) , tweets
  UserProfileController({
    required TweetRepository tweetRepo,
    required UserRepsitory userRepo,
    required Authenticator authenticator,
    required NotificationNotifier notificationNotifier,
    // required NotificationController notificationController,
  })  : _tweetRepo = tweetRepo,
        _userRepo = userRepo,
        _authenticator = authenticator,
        _notificationNotifier = notificationNotifier,
        // _notificationController = notificationController,
        super(const UserProfileState.init());

  final TweetRepository _tweetRepo;
  final UserRepsitory _userRepo;
  final Authenticator _authenticator;
  final NotificationNotifier _notificationNotifier;
  // final NotificationController _notificationController;

  Future<List<Tweet>> getUsersTweets(String uid) async {
    final tweets = await _tweetRepo.getUsersTweets(uid);
    return tweets;
  }

  Future<model.User?> getUserDetailInfo(String uid) async {
    state = const UserProfileState.loading();
    try {
      final user = await _userRepo.getUserData(uid);
      if (user != null) {
        final userTweets = await getUsersTweets(uid);
        state = UserProfileState.data(userData: user, tweetsData: userTweets);
        return user;
      } else {
        state = const UserProfileState.error();
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      state = const UserProfileState.error();
      return null;
    }
  }

  Future<model.User?> getUserInfoOnly(String uid) async {
    try {
      final user = await _userRepo.getUserData(uid);
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  FutureEither<model.User> updateUserProfile(
      {required model.User user,
      required File? profileFile,
      String bio = ''}) async {
    state = const UserProfileState.loading();
    if (profileFile != null) {
      final profileUrl = await _tweetRepo.uploadImage(profileFile);
      user = user.copyWith(profilePic: profileUrl, bio: bio);
    } else {
      user = user.copyWith(bio: bio);
    }

    final res = await _userRepo.updateUserData(user);
    res.fold((l) {
      debugPrint(l.messsage);
    }, (r) {
      state = state.maybeWhen(
        orElse: () => state,
        data: (userData, tweetsData) =>
            UserProfileState.data(userData: r, tweetsData: tweetsData),
      );
      _userRepo.updateUserUI(r.uid, r.profilePic);
    });
    return res;
  }

  FutureEither<model.User> updateUserBanner(
      {required model.User user, required File bannerPic}) async {
    final bannerUrl = await _tweetRepo.uploadImage(bannerPic);
    user = user.copyWith(bannerPic: bannerUrl);

    final res = await _userRepo.updateUserData(user);
    res.fold((l) {
      debugPrint(l.messsage);
    }, (r) {
      state = state.maybeWhen(
        orElse: () => state,
        data: (userData, tweetsData) =>
            UserProfileState.data(userData: r, tweetsData: tweetsData),
      );
    });
    return res;
  }

  void followUser(
      {required model.User followedUser,
      required BuildContext context,
      required model.User currentUser}) async {
    final followersList = [...followedUser.followers];
    final follwingsList = [...currentUser.following];

    //already following
    if (followedUser.followers.contains(currentUser.uid)) {
      followersList.remove(currentUser.uid);
      follwingsList.remove(followedUser.uid);
    } else {
      followersList.add(currentUser.uid);
      follwingsList.add(followedUser.uid);
    }

    followedUser = followedUser.copyWith(followers: followersList);
    currentUser = currentUser.copyWith(following: follwingsList);

    final res = await _userRepo.followUser(
        currentuser: currentUser, followedUser: followedUser);
    res.fold((l) => debugPrint(l.messsage), (r) {
      _notificationNotifier.createNotification(
        text: ' start following you',
        postId: '',
        notificationType: NotificationType.follow,
        receiverID: followedUser.uid,
        senderID: currentUser.uid,
      );
      state = state.maybeWhen(
        orElse: () => state,
        data: (userData, tweetsData) => UserProfileState.data(
            userData: userData.copyWith(followers: followedUser.followers),
            tweetsData: tweetsData),
      );
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserOnlineInfo(String userId) {
    final stream = _userRepo.getUserOnlineInfo(userId);

    return stream;
  }

  FutureEither<void> updateActiveStatus(bool isOnline) async {
    try {
      final userId = _authenticator.currentUser?.uid;
      final res = await _userRepo.updateActiveStatus(userId ?? '', isOnline);

      return res;
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'user_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<void> updateBlueAccount() async {
    try {
      final userId = _authenticator.currentUser?.uid ?? '';
      final res = await _userRepo.updateBlueAccount(userId);
      return res;
    } catch (e, st) {
      debugPrint('upgrade account error: ${e.toString()}');
      return left(Failure(e.toString(), st));
    }
  }
}
