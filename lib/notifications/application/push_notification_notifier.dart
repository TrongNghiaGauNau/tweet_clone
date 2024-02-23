import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/notifications/infrastructure/push_notification_repo.dart';

class PushNotificationNotifier extends StateNotifier<void> {
  PushNotificationNotifier({required this.pushNotiRepo}) : super(null);
  final PushNotificationRepository pushNotiRepo;

  Future<void> getFirebaseMessagingToken() async {
    await pushNotiRepo.getFirebaseMessagingToken();
  }

  Future<void> sendPushNoti(
      {required String senderName,
      required String receiverToken,
      required String bodyMessage}) async {
    await pushNotiRepo.sendNotification(
        senderName: senderName,
        bodyMessage: bodyMessage,
        receiverToken: receiverToken);
  }
}
