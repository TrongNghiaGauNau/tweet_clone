// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ui.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUIImpl _$$UserUIImplFromJson(Map<String, dynamic> json) => _$UserUIImpl(
      name: json['name'] as String,
      profilePic: json['profilePic'] as String,
      uid: json['uid'] as String,
      isTwitterBlue: json['isTwitterBlue'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserUIImplToJson(_$UserUIImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profilePic': instance.profilePic,
      'uid': instance.uid,
      'isTwitterBlue': instance.isTwitterBlue,
    };
