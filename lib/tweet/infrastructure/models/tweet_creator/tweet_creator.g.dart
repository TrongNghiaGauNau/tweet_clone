// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TweetCreatorImpl _$$TweetCreatorImplFromJson(Map<String, dynamic> json) =>
    _$TweetCreatorImpl(
      profilePic: json['profilePic'] as String,
      uid: json['uid'] as String,
      isTwitterBlue: json['isTwitterBlue'] as bool? ?? false,
    );

Map<String, dynamic> _$$TweetCreatorImplToJson(_$TweetCreatorImpl instance) =>
    <String, dynamic>{
      'profilePic': instance.profilePic,
      'uid': instance.uid,
      'isTwitterBlue': instance.isTwitterBlue,
    };
