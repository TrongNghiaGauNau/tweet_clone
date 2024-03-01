// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      receiverId: json['receiverId'] as String,
      senderId: json['senderId'] as String,
      message: json['message'] as String,
      sentAt: json['sentAt'] as String,
      imagesIdList: (json['imagesIdList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      seen: json['seen'] as bool? ?? false,
      replyMessage: json['replyMessage'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'message': instance.message,
      'sentAt': instance.sentAt,
      'imagesIdList': instance.imagesIdList,
      'seen': instance.seen,
      'replyMessage': instance.replyMessage,
    };
