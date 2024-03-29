import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/presentation/constants/assets_constants.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/presentation/views/tweet_detail.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/carousel_image.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/hashtag_text.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_icons_button.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_menu_popup.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart'
    as model;

class DetailTweetCard extends HookConsumerWidget {
  const DetailTweetCard({
    super.key,
    required this.tweet,
    required this.currentUser,
  });

  final Tweet tweet;
  final User currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref
        .watch(userDetailsProvider(
            tweet.tweetCreator[TweetCreator.creatorUID] ?? ''))
        .value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: const EdgeInsets.all(10).copyWith(top: 1),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user != null
                        ? user.profilePic.isNotEmpty
                            ? user.profilePic
                            : defaultAvatar
                        : defaultAvatar),
                    radius: 35,
                  ),
                ),
                if (user != null && user.isTwitterBlue)
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            Image.asset('assets/images/blue_account_icon.png'),
                      )),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //retweeted
                  if (tweet.reTweeetId.isNotEmpty)
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
                        const Text(
                          ' retweeted',
                          style: TextStyle(
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
                        child: Text(user != null ? user.name : 'username',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19)),
                      ),
                      Text(
                        timeago.format(DateTime.parse(tweet.tweetedAt),
                            locale: 'en_short'),
                        style: const TextStyle(
                            fontSize: 17, color: Pallete.greyColor),
                      ),
                      const Spacer(),
                      TweetMenuPopup(tweet: tweet, isPop: true),
                    ],
                  ),
                  HashtagOrLinkText(text: tweet.text),
                  if (tweet.tweetType == TweetType.image.name)
                    CarouselImage(tweet: tweet),
                  // if(tweet.reTweetId.isNO)
                  const SizedBox(height: 5),
                  Consumer(
                    builder: (context, ref, child) {
                      final childTweet = ref.watch(
                          singleTweetControllerProvider(tweet.reTweeetId));
                      if (childTweet == null) return const SizedBox.shrink();
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5).copyWith(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => TwitterDetailScreen(
                                    tweetId: childTweet.id,
                                  ),
                                )),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10)
                                          .copyWith(top: 1),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(childTweet
                                                    .tweetCreator[
                                                TweetCreator.creatorAvatar] ??
                                            defaultAvatar),
                                        radius: 20,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      child: Text(
                                          childTweet.tweetCreator[
                                                  TweetCreator.creatorName] ??
                                              'username',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19)),
                                    ),
                                    Text(
                                      timeago.format(
                                          DateTime.parse(childTweet.tweetedAt),
                                          locale: 'en_short'),
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Pallete.greyColor),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: HashtagOrLinkText(text: tweet.text),
                              ),
                              if (childTweet.tweetType == TweetType.image.name)
                                CarouselImage(tweet: childTweet),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                          onTap: () {},
                        ),
                        TweetIconButton(
                          pathName: AssetsConstants.retweetIcon,
                          text: (tweet.reshareCount).toString(),
                          onTap: () async {
                            //thay đổii state trong list
                            if (user == null) {
                              showSnackbar(context,
                                  'Can not reshare this tweet due to some error');
                              return;
                            }
                            final reshareListTweet = await ref
                                .read(tweetControllerProvider.notifier)
                                .reshareTweet(tweet, context, currentUser.uid);
                            if (reshareListTweet == null && context.mounted) {
                              showSnackbar(context,
                                  'Oops. Can not retweet due to some error');
                              return;
                            }
                            //add tweet moi dc tao len tren dau list news
                            ref
                                .read(tweetControllerProvider.notifier)
                                .addTweet(reshareListTweet![1]);
                            //thay doi state trong single
                            ref
                                .read(singleTweetControllerProvider(tweet.id)
                                    .notifier)
                                .updatePost(reshareListTweet[0]);
                          },
                        ),
                        LikeButton(
                          size: 25,
                          onTap: (isLiked) async {
                            ref
                                .read(singleTweetControllerProvider(tweet.id)
                                    .notifier)
                                .likeTweet(tweet, currentUser.uid);
                            return !isLiked;
                          },
                          isLiked: tweet.likes.contains(currentUser.uid),
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
                              padding: const EdgeInsets.only(left: 2.0),
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
                  const SizedBox(height: 1),
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
  }
}
