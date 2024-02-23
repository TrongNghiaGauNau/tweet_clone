// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListInitImpl _$$ChatListInitImplFromJson(Map<String, dynamic> json) =>
    _$ChatListInitImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatListInitImplToJson(_$ChatListInitImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatListDataImpl _$$ChatListDataImplFromJson(Map<String, dynamic> json) =>
    _$ChatListDataImpl(
      chatList: (json['chatList'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatListDataImplToJson(_$ChatListDataImpl instance) =>
    <String, dynamic>{
      'chatList': instance.chatList,
      'runtimeType': instance.$type,
    };

_$ChatListErrorImpl _$$ChatListErrorImplFromJson(Map<String, dynamic> json) =>
    _$ChatListErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatListErrorImplToJson(_$ChatListErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatListEmptyImpl _$$ChatListEmptyImplFromJson(Map<String, dynamic> json) =>
    _$ChatListEmptyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatListEmptyImplToJson(_$ChatListEmptyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatListLoadingImpl _$$ChatListLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatListLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatListLoadingImplToJson(
        _$ChatListLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
