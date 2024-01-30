// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentStateImpl _$$CommentStateImplFromJson(Map<String, dynamic> json) =>
    _$CommentStateImpl(
      tweetComments: (json['tweetComments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentStateImplToJson(_$CommentStateImpl instance) =>
    <String, dynamic>{
      'tweetComments': instance.tweetComments,
      'isLoading': instance.isLoading,
    };
