import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/application/user_notifier.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_profile_state.dart';

final userControllerProvider =
    StateNotifierProvider<UserProfileController, UserProfileState>((ref) {
  return UserProfileController(
    tweetRepo: ref.watch(tweetRepositoryProvider),
    userRepo: ref.watch(userRepositoryProvider),
    authenticator: ref.watch(firebaseAuthProvider),
  );
});

final userDetail = FutureProvider.family((ref, String uid) =>
    ref.watch(userControllerProvider.notifier).getUserDetailInfo(uid));
