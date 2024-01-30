// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      text: json['text'] as String,
      hashTags: (json['hashTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      link: json['link'] as String?,
      imagesLink: (json['imagesLink'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      uid: json['uid'] as String,
      createdAt: json['createdAt'] as String,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String,
      repliedTo: json['repliedTo'] as String?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'hashTags': instance.hashTags,
      'link': instance.link,
      'imagesLink': instance.imagesLink,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'likes': instance.likes,
      'id': instance.id,
      'repliedTo': instance.repliedTo,
    };
