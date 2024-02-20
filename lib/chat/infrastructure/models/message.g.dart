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
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'message': instance.message,
      'sentAt': instance.sentAt,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.media: 'media',
  MessageType.mix: 'mix',
};
