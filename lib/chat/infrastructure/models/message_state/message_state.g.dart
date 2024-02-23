// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageStateImpl _$$MessageStateImplFromJson(Map<String, dynamic> json) =>
    _$MessageStateImpl(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      showSeen: json['showSeen'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageStateImplToJson(_$MessageStateImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'showSeen': instance.showSeen,
    };
