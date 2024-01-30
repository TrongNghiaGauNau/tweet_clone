// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      followers:
          (json['followers'] as List<dynamic>).map((e) => e as String).toList(),
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
      profilePic: json['profilePic'] as String,
      bannerPic: json['bannerPic'] as String,
      uid: json['uid'] as String,
      bio: json['bio'] as String,
      isTwitterBlue: json['isTwitterBlue'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'followers': instance.followers,
      'following': instance.following,
      'profilePic': instance.profilePic,
      'bannerPic': instance.bannerPic,
      'uid': instance.uid,
      'bio': instance.bio,
      'isTwitterBlue': instance.isTwitterBlue,
    };
