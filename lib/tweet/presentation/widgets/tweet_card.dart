import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/presentation/constants/assets_constants.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/presentation/views/tweet_detail.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/carousel_image.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/hashtag_text.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/loading_single_tweet.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_icons_button.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/presentation/views/profile_screen.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class TweetCard extends HookConsumerWidget {
  const TweetCard({super.key, required this.tweetData});

  final Tweet tweetData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    final tweet = ref.watch(singleTweetControllerProvider(tweetData.id));
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;
    // final user = ref.watch(userDetailsProvider(tweet?.uid ?? '')).value;
    // final user = ref.watch(userDetail(tweetData.id));
    final user = ref.watch(userDetail(tweet?.tweetCreator.uid ?? ''));

    useEffect(() {
      Future(() => ref
          .read(userControllerProvider.notifier)
          .getUserDetailInfo(tweetData.tweetCreator.uid));
      return null;
    }, []);

    return currentUser == null || tweet == null
        ? const LoadingSingleTweet()
        : user.maybeWhen(
            error: (error, stackTrace) => const Center(
              child: Text('Oops.Something went wrong'),
            ),
            loading: () {
              return const LoadingSingleTweet();
            },
            orElse: () {
              return const SizedBox.shrink();
            },
            data: (userData) {
              if (userData == null) {
                return const Center(
                  child: Text('Can not get this user data'),
                );
              }
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10).copyWith(top: 1),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(uid: tweet.tweetCreator.uid),
                          )),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                userData.profilePic != ''
                                    ? userData.profilePic
                                    : defaultAvatar),
                            radius: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //retweeted
                            if (tweet.retweetedBy.isNotEmpty)
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsConstants.retweetIcon,
                                    color: Pallete.greyColor,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '${tweet.retweetedBy} retweeted',
                                    style: const TextStyle(
                                        color: Pallete.greyColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Text(userData?.name ?? 'username',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19)),
                                ),
                                Text(
                                  timeago.format(
                                      DateTime.parse(tweet.tweetedAt),
                                      locale: 'en_short'),
                                  style: const TextStyle(
                                      fontSize: 17, color: Pallete.greyColor),
                                ),
                              ],
                            ),
                            HashtagOrLinkText(text: tweet.text),
                            if (tweet.tweetType == TweetType.image.name)
                              CarouselImage(imageLinks: tweet.imagesLink),
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 20),
                              child: Row(
                                children: [
                                  TweetIconButton(
                                    pathName: AssetsConstants.viewsIcon,
                                    text: (tweet.commentsIds.length +
                                            tweet.reshareCount +
                                            tweet.likes.length)
                                        .toString(),
                                    onTap: () {},
                                  ),
                                  TweetIconButton(
                                    pathName: AssetsConstants.commentIcon,
                                    text: (tweet.commentsIds.length).toString(),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            TwitterDetailScreen(
                                                tweetId: tweet.id,
                                                commentsIds: tweet.commentsIds),
                                      ));
                                    },
                                  ),
                                  TweetIconButton(
                                    pathName: AssetsConstants.retweetIcon,
                                    text: (tweet.reshareCount).toString(),
                                    onTap: () async {
                                      if (userData == null) return;
                                      //thay đổii state trong list
                                      final reshareListTweet = await ref
                                          .read(
                                              tweetControllerProvider.notifier)
                                          .reshareTweet(
                                              tweet, userData, context);
                                      //add tweet moi dc tao len tren dau list news
                                      ref
                                          .read(
                                              tweetControllerProvider.notifier)
                                          .addTweet(reshareListTweet[1]);
                                      //thay doi state trong single
                                      ref
                                          .read(singleTweetControllerProvider(
                                                  tweetData.id)
                                              .notifier)
                                          .updatePost(reshareListTweet[0]);
                                    },
                                  ),
                                  LikeButton(
                                    size: 25,
                                    onTap: (isLiked) async {
                                      ref
                                          .read(singleTweetControllerProvider(
                                                  tweetData.id)
                                              .notifier)
                                          .likeTweet(tweet, currentUser.uid);
                                      return !isLiked;
                                    },
                                    isLiked:
                                        tweet.likes.contains(currentUser.uid),
                                    likeBuilder: (isLiked) {
                                      return isLiked
                                          ? SvgPicture.asset(
                                              AssetsConstants.likeFilledIcon,
                                              color: Pallete.redColor,
                                            )
                                          : SvgPicture.asset(
                                              AssetsConstants.likeOutlinedIcon,
                                              color: Pallete.greyColor,
                                            );
                                    },
                                    likeCount: tweet.likes.length,
                                    countBuilder: (likeCount, isLiked, text) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Text(text,
                                            style: TextStyle(
                                                color: isLiked
                                                    ? Pallete.redColor
                                                    : Pallete.greyColor,
                                                fontSize: 16)),
                                      );
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share_outlined,
                                        size: 25,
                                        color: Pallete.greyColor,
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Pallete.greyColor,
                  ),
                ],
              );
            },
          );
  }
}

class LoadingPost extends StatelessWidget {
  const LoadingPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(),
          ),
        ),
        const SizedBox(height: 10),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(),
          ),
        ),
        const SizedBox(height: 10),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(),
          ),
        ),
      ],
    );
  }
}
