import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';

part 'tweet_state.freezed.dart';

part 'tweet_state.g.dart';

@freezed
class TweetState with _$TweetState {
  const factory TweetState({
    required Tweet? tweets,
    required bool isLoading,
  }) = _TweetState;

  factory TweetState.fromJson(Map<String, dynamic> json) =>
      _$TweetStateFromJson(json);
}
