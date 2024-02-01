// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationInitImpl _$$NotificationInitImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationInitImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationInitImplToJson(
        _$NotificationInitImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      notificationList: (json['notificationList'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'notificationList': instance.notificationList,
      'runtimeType': instance.$type,
    };

_$NotificationErrorImpl _$$NotificationErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationErrorImplToJson(
        _$NotificationErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NotificationEmptyImpl _$$NotificationEmptyImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationEmptyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationEmptyImplToJson(
        _$NotificationEmptyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NotificationLoadingImpl _$$NotificationLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationLoadingImplToJson(
        _$NotificationLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
