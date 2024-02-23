import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/application/push_notification_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_state/notification_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';

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

final pushNotificationProvider =
    StateNotifierProvider<PushNotificationNotifier, void>((ref) {
  return PushNotificationNotifier(
      pushNotiRepo: ref.watch(pushNotificationRepository));
});
