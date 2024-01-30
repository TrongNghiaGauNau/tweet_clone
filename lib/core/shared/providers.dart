import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/application/authenticator.dart';
import 'package:twitter_clone_2/search/infrastructure/search_repository.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/user_repository.dart';

final firebaseAuthProvider = Provider((_) => Authenticator());
final userRepositoryProvider = Provider((_) => UserRepsitory());
final tweetRepositoryProvider = Provider((ref) => TweetRepository());
final searchRepositoryProvider = Provider((ref) => SearchRepository());
// final systemNotiRepositoryProvider =
//     Provider((ref) => NotificationRepository());
