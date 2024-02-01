import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String text,
    required String postId,
    required String id,
    required String receiverID,
    required String senderID,
    // required String senderAvatar,
    // required String senderName,
    required String createdAt,
    required NotificationType notificationType,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

enum NotificationType {
  like('like'),
  reply('reply'),
  follow('follow');

  final String type;
  const NotificationType(this.type);
}

extension ConvertTweet on String {
  NotificationType toNotificationTypeEnum() {
    switch (this) {
      case 'like':
        return NotificationType.like;
      case 'reply':
        return NotificationType.reply;
      case 'follow':
        return NotificationType.follow;
      default:
        return NotificationType.like;
    }
  }
}
