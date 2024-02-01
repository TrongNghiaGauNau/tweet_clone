// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      text: json['text'] as String,
      postId: json['postId'] as String,
      id: json['id'] as String,
      receiverID: json['receiverID'] as String,
      senderID: json['senderID'] as String,
      createdAt: json['createdAt'] as String,
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'postId': instance.postId,
      'id': instance.id,
      'receiverID': instance.receiverID,
      'senderID': instance.senderID,
      'createdAt': instance.createdAt,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.reply: 'reply',
  NotificationType.follow: 'follow',
};
