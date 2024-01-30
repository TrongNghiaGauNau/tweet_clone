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
      uid: json['uid'] as String,
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'postId': instance.postId,
      'id': instance.id,
      'uid': instance.uid,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.reply: 'reply',
  NotificationType.follow: 'follow',
  NotificationType.retweet: 'retweet',
};
