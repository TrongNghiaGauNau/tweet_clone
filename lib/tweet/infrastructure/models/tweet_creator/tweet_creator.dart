import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet_creator.freezed.dart';

part 'tweet_creator.g.dart';

@freezed
class TweetCreator with _$TweetCreator {
  const factory TweetCreator({
    required String profilePic,
    required String uid,
    @Default(false) bool isTwitterBlue,
  }) = _TweetCreator;

  factory TweetCreator.fromJson(Map<String, dynamic> json) =>
      _$TweetCreatorFromJson(json);
}
