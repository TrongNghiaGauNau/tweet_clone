import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/application/single_in_app_noti_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_state/notification_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui_state/user_ui_state.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

final notificationNotifierProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(
      notificationAPI: ref.watch(notificationRepository),
      authenticator: ref.watch(firebaseAuthProvider));
});

final userUIDetail =
    FutureProvider.family<UserUI?, String>((ref, String uid) async {
  return await ref.watch(userRepositoryProvider).getUserUIData(uid);
});

final singleInAppNotificationProvider =
    StateNotifierProvider.family<SingleNotiInAppNotifier, UserUI?, String>(
        (ref, uid) {
  return SingleNotiInAppNotifier(
      userUI: ref.watch(userUIDetail(uid)).valueOrNull);
});
// final singleInAppNotificationProvider =
//     StateNotifierProvider.family<SingleNotiInAppNotifier, User?, String>(
//         (ref, senderId) {
//   return SingleNotiInAppNotifier(
//     ref.watch(userDetail(senderId)).valueOrNull,
//   );
// });
