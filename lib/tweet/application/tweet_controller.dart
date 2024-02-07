import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart'
    as model;
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/core/presentation/extension/list_extension.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_list_state.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';
import 'package:uuid/uuid.dart';

class TweetController extends StateNotifier<TweetListState> {
  TweetController(this._tweetRepository, this.ref)
      : super(const TweetListState());

  final TweetRepository _tweetRepository;
  final Ref ref;

  Future<Either<Failure, Tweet>?> shareTweet({
    required List<File> images,
    required String text,
  }) async {
    final userId = ref.read(firebaseAuthProvider).currentUser?.uid ?? '';
    final currentUser = await ref
        .read(userControllerProvider.notifier)
        .getUserDetailInfo(userId);
    if (currentUser == null) {
      return null;
    }
    final Map<String, String> tweetCreator = {
      TweetCreator.creatorAvatar: currentUser.profilePic,
      TweetCreator.creatorUID: currentUser.uid,
      TweetCreator.creatorName: currentUser.name,
    };
    if (images.isNotEmpty) {
      final res = await _shareImageTweet(
          images: images, text: text, tweetCreator: tweetCreator);
      return res;
    } else {
      final res = await _shareTextTweet(text: text, tweetCreator: tweetCreator);
      return res;
    }
  }

  Future<Either<Failure, Tweet>> _shareImageTweet(
      {required List<File> images,
      required String text,
      required Map<String, String> tweetCreator}) async {
    state = state.copyWith(isLoading: true);
    final hashTags = getHashtagsFromText(text);
    final link = getLinkFromText(text);
    const uuid = Uuid();
    final imageLinks = await _tweetRepository.uploadImages(images);
    final tweet = Tweet(
      text: text,
      hashTags: hashTags,
      link: link,
      imagesLink: imageLinks,
      tweetType: TweetType.image.name,
      tweetedAt: DateTime.now().toIso8601String(),
      likes: const [],
      commentsIds: const [],
      id: uuid.v4(),
      reshareCount: 0,
      reTweeetId: '',
      tweetCreator: tweetCreator,
    );
    final res = await _tweetRepository.shareTweet(tweet);
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future<Either<Failure, Tweet>> _shareTextTweet(
      {required String text, required Map<String, String> tweetCreator}) async {
    state = state.copyWith(isLoading: true);
    final hashTags = getHashtagsFromText(text);
    final link = getLinkFromText(text);
    const uuid = Uuid();
    final tweet = Tweet(
        text: text,
        hashTags: hashTags,
        link: link,
        imagesLink: const [],
        tweetType: TweetType.text.name,
        tweetedAt: DateTime.now().toIso8601String(),
        likes: const [],
        commentsIds: const [],
        id: uuid.v4(),
        reshareCount: 0,
        reTweeetId: '',
        tweetCreator: tweetCreator);
    final res = await _tweetRepository.shareTweet(tweet);
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future<List<Tweet>?> reshareTweet(
      Tweet tweet, BuildContext context, String retweetUserId) async {
    final currentUser = await ref
        .read(userControllerProvider.notifier)
        .getUserDetailInfo(retweetUserId);
    if (currentUser == null) {
      return null;
    }
    final Map<String, String> tweetCreator = {
      TweetCreator.creatorAvatar: currentUser.profilePic,
      TweetCreator.creatorUID: currentUser.uid,
      TweetCreator.creatorName: currentUser.name,
    };

    tweet = tweet.copyWith(reshareCount: tweet.reshareCount + 1);
    final newId = const Uuid().v4();
    // final hashTags = getHashtagsFromText(text);
    // final link = getLinkFromText(text);
    final newTweet = Tweet(
      text: '',
      hashTags: [],
      link: '',
      imagesLink: [],
      tweetType: TweetType.text.name,
      tweetedAt: DateTime.now().toIso8601String(),
      likes: const [],
      commentsIds: const [],
      id: newId,
      reshareCount: 0,
      reTweeetId: tweet.id,
      tweetCreator: tweetCreator,
    );

    //update original tweet reshare count
    final res = await _tweetRepository.updateReshareAccount(tweet);

    //retweet
    res.fold((l) => showSnackbar(context, l.messsage), (r) async {
      final res2 = await _tweetRepository.shareTweet(newTweet);
      if (context.mounted) {
        showSnackbar(context, 'Reshare tweet successfully');
      }
      res2.fold((l) => debugPrint(l.messsage), (r) => null);
    });
    return [tweet, newTweet];
  }

  FutureVoid getTweets(WidgetRef ref) async {
    state = state.copyWith(isLoading: true);
    final currentUserId = ref.read(firebaseAuthProvider).currentUser?.uid ?? '';
    final userInfo = await ref
        .read(authControllerProvider.notifier)
        .getUserData(currentUserId);
    final List<String> followedUser = [...userInfo?.following ?? []];

    if (currentUserId.isNotEmpty) {
      followedUser.add(currentUserId);
    }

    if (followedUser.isEmpty) {
      state = state.copyWith(isLoading: false);
    } else {
      final tweetsList = await _tweetRepository.getTweets(followedUser);
      state = state.copyWith(isLoading: false, tweetsList: tweetsList);
    }
  }

  FutureVoid getTweetsByHashtag(String hashtag) async {
    state = state.copyWith(isLoading: true);

    final tweetsListByHashtag =
        await _tweetRepository.getTweetsByHashtag(hashtag);
    state = state.copyWith(
        isLoading: false, tweetsListByHashtag: tweetsListByHashtag);
  }

  addTweet(Tweet tweet) {
    final newData = List.of(state.tweetsList)..insertOrAdd(0, tweet);
    state = state.copyWith(tweetsList: newData);
  }

  Future<void> deleteTweet(Tweet tweet) async {
    await _tweetRepository.deleteTweet(tweet.id);
    final newData = List.of(state.tweetsList)..remove(tweet);
    state = state.copyWith(tweetsList: newData);
  }
}
