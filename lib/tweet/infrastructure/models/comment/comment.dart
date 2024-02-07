import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String text,
    required List<String>? hashTags,
    required String? link,
    required List<String>? imagesLink,
    required String uid,
    required String createdAt,
    required List<String>? likes,
    required String id,
    required String tweetId,
    required String? repliedTo,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
