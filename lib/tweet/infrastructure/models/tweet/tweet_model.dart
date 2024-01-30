import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet_creator/tweet_creator.dart';

part 'tweet_model.freezed.dart';

part 'tweet_model.g.dart';

@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    required String text,
    required List<String> hashTags,
    required String link,
    required List<String> imagesLink,
    required String tweetType,
    required String tweetedAt,
    required List<String> likes,
    required List<String> commentsIds,
    required String id,
    required int reshareCount,
    required String retweetedBy,
    required String repliedTo,
    required TweetCreator tweetCreator,
  }) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}

enum TweetType {
  text('text'),
  image('image');

  final String type;
  const TweetType(this.type);
}

extension ConvertTweet on String {
  TweetType toTweetTypeEnum() {
    switch (this) {
      case 'text':
        return TweetType.text;
      case 'image':
        return TweetType.image;
      default:
        return TweetType.text;
    }
  }
}
