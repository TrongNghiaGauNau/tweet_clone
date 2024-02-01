import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/application/notification_notifier.dart';
import 'package:twitter_clone_2/notifications/application/single_in_app_noti_notifier.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_state/notification_state.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

final notificationNotifierProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(
      notificationAPI: ref.watch(notificationRepository),
      authenticator: ref.watch(firebaseAuthProvider));
});

final singleInAppNotificationProvider =
    StateNotifierProvider<SingleNotiInAppNotifier, User?>((ref) {
  return SingleNotiInAppNotifier(ref);
});
