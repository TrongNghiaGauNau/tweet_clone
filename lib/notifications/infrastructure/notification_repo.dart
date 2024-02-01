import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';

class NotificationRepository {
  final _notiRepo = FirebaseFirestore.instance.collection('notifications');

  FutureEitherVoid createNotification(NotificationModel notification) async {
    try {
      await _notiRepo.doc(notification.id).set(notification.toJson());
      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'notification_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<NotificationModel>> getNotifications(String uid) async {
    try {
      List<NotificationModel> notificationList = [];

      final documents = await _notiRepo
          .where('receiverID', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .get();
      notificationList = documents.docs
          .map((doc) => NotificationModel.fromJson(doc.data()))
          .toList();

      return right(notificationList);
    } catch (error, st) {
      debugPrint('Can not get tweet comment: $error');
      return left(Failure(error.toString(), st));
    }
  }
}
