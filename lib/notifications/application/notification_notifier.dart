import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/application/authenticator.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_state/notification_state.dart';
import 'package:twitter_clone_2/notifications/infrastructure/notification_repo.dart';
import 'package:uuid/uuid.dart';

//tao userUI tren firebase
//moi lan thang user nao do thay avatar thi cap nhat userUI
//o screen noti thi watch toi thang userUI do de lay avatar chu ko watch user chi tiet

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier(
      {required NotificationRepository notificationAPI,
      required Authenticator authenticator})
      : _notificationAPI = notificationAPI,
        _authenticator = authenticator,
        super(const NotificationState.init());

  final NotificationRepository _notificationAPI;
  final Authenticator _authenticator;

  void createNotification({
    required String text,
    required String postId,
    required NotificationType notificationType,
    required String receiverID,
    required String senderID,
  }) async {
    const uuid = Uuid();
    final notification = NotificationModel(
        text: text,
        postId: postId,
        id: uuid.v4(),
        receiverID: receiverID,
        createdAt: DateTime.now().toIso8601String(),
        senderID: senderID,
        notificationType: notificationType);
    final res = await _notificationAPI.createNotification(notification);
    res.fold((l) => debugPrint(l.messsage), (r) => null);
  }

  Future<void> getNotifications() async {
    state = const NotificationState.loading();
    try {
      final currentUID = _authenticator.currentUser?.uid ?? '';
      final notifications = await _notificationAPI.getNotifications(currentUID);
      notifications.fold((l) => debugPrint(l.messsage), (notificationList) {
        if (notificationList.isEmpty) {
          state = const NotificationState.empty();
        } else if (notificationList.isNotEmpty) {
          state = NotificationState.data(notificationList: notificationList);
        } else {
          state = const NotificationState.error();
        }
      });
    } catch (e) {
      debugPrint('notification_error: $e');
      state = const NotificationState.error();
    }
  }
}
