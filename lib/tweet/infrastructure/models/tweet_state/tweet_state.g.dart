// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TweetStateImpl _$$TweetStateImplFromJson(Map<String, dynamic> json) =>
    _$TweetStateImpl(
      tweets: json['tweets'] == null
          ? null
          : Tweet.fromJson(json['tweets'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool,
    );

Map<String, dynamic> _$$TweetStateImplToJson(_$TweetStateImpl instance) =>
    <String, dynamic>{
      'tweets': instance.tweets,
      'isLoading': instance.isLoading,
    };
