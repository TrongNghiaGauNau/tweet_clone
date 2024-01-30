import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/comment/comment.dart';

part 'comment_state.freezed.dart';

part 'comment_state.g.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default([]) List<Comment> tweetComments,
    @Default(false) bool isLoading,
  }) = _CommentState;

  factory CommentState.fromJson(Map<String, dynamic> json) =>
      _$CommentStateFromJson(json);
}
