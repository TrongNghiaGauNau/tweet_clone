import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/application/user_notifier.dart';
import 'package:twitter_clone_2/user_profile/application/user_ui_notifier.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_profile_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui_state/user_ui_state.dart';

final userControllerProvider =
    StateNotifierProvider<UserProfileController, UserProfileState>((ref) {
  return UserProfileController(
    tweetRepo: ref.watch(tweetRepositoryProvider),
    userRepo: ref.watch(userRepositoryProvider),
    authenticator: ref.watch(firebaseAuthProvider),
    notificationNotifier: ref.watch(notificationNotifierProvider.notifier),
  );
});

final userDetail =
    FutureProvider.family<User?, String>((ref, String uid) async {
  return await ref
      .watch(userControllerProvider.notifier)
      .getUserDetailInfo(uid);
});

final userUINotifierProvider =
    StateNotifierProvider<UserUINotifier, UserUIState>((ref) {
  return UserUINotifier(userRepo: ref.watch(userRepositoryProvider));
});
