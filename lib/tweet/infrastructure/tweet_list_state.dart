import 'package:equatable/equatable.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';

class TweetListState extends Equatable {
  const TweetListState({
    this.tweetsList = const [],
    this.tweetsListByHashtag = const [],
    this.isLoading = false,
  });

  final List<Tweet> tweetsList;
  final List<Tweet> tweetsListByHashtag;
  final bool isLoading;

  TweetListState copyWith({
    final List<Tweet>? tweetsList,
    final List<Tweet>? tweetsListByHashtag,
    final bool? isLoading,
  }) =>
      TweetListState(
        tweetsList: tweetsList ?? this.tweetsList,
        tweetsListByHashtag: tweetsListByHashtag ?? this.tweetsListByHashtag,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [tweetsList, tweetsListByHashtag, isLoading];
}
