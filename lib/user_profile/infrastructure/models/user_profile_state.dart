import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const UserProfileState._();
  const factory UserProfileState.init() = _UserProfileInit;
  const factory UserProfileState.data({
    required User userData,
    required List<Tweet> tweetsData,
  }) = _UserProfileSuccess;
  const factory UserProfileState.error() = _UserProfileFailure;
  const factory UserProfileState.loading() = _UserProfileLoading;
}
