// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatInitImpl _$$ChatInitImplFromJson(Map<String, dynamic> json) =>
    _$ChatInitImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatInitImplToJson(_$ChatInitImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatDataImpl _$$ChatDataImplFromJson(Map<String, dynamic> json) =>
    _$ChatDataImpl(
      messageList: (json['messageList'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatDataImplToJson(_$ChatDataImpl instance) =>
    <String, dynamic>{
      'messageList': instance.messageList,
      'runtimeType': instance.$type,
    };

_$ChatErrorImpl _$$ChatErrorImplFromJson(Map<String, dynamic> json) =>
    _$ChatErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatErrorImplToJson(_$ChatErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatEmptyImpl _$$ChatEmptyImplFromJson(Map<String, dynamic> json) =>
    _$ChatEmptyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatEmptyImplToJson(_$ChatEmptyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatLoadingImpl _$$ChatLoadingImplFromJson(Map<String, dynamic> json) =>
    _$ChatLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatLoadingImplToJson(_$ChatLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
