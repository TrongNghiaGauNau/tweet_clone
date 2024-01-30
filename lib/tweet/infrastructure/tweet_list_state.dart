import 'package:equatable/equatable.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';

class TweetListState extends Equatable {
  const TweetListState({
    this.tweetsList = const [],
    this.isLoading = false,
  });

  final List<Tweet> tweetsList;
  final bool isLoading;

  TweetListState copyWith({
    final List<Tweet>? tweetsList,
    final bool? isLoading,
  }) =>
      TweetListState(
        tweetsList: tweetsList ?? this.tweetsList,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [tweetsList, isLoading];
}
