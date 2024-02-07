// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TweetImpl _$$TweetImplFromJson(Map<String, dynamic> json) => _$TweetImpl(
      text: json['text'] as String,
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      link: json['link'] as String,
      imagesLink: (json['imagesLink'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tweetType: json['tweetType'] as String,
      tweetedAt: json['tweetedAt'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      commentsIds: (json['commentsIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      reshareCount: json['reshareCount'] as int,
      reTweeetId: json['reTweeetId'] as String,
      tweetCreator: Map<String, String>.from(json['tweetCreator'] as Map),
    );

Map<String, dynamic> _$$TweetImplToJson(_$TweetImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'hashTags': instance.hashTags,
      'link': instance.link,
      'imagesLink': instance.imagesLink,
      'tweetType': instance.tweetType,
      'tweetedAt': instance.tweetedAt,
      'likes': instance.likes,
      'commentsIds': instance.commentsIds,
      'id': instance.id,
      'reshareCount': instance.reshareCount,
      'reTweeetId': instance.reTweeetId,
      'tweetCreator': instance.tweetCreator,
    };
