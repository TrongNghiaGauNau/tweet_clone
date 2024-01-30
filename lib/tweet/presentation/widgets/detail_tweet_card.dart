import 'package:any_link_preview/any_link_preview.dart';
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
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/carousel_image.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/hashtag_text.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_icons_button.dart';
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
  final User? currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailsProvider(tweet.tweetCreator.uid)).value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10).copyWith(top: 1),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user != null
                    ? user!.profilePic != ''
                        ? user!.profilePic
                        : defaultAvatar
                    : defaultAvatar),
                radius: 35,
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
                        child: Text(user != null ? user!.name : 'username',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19)),
                      ),
                      Text(
                        timeago.format(DateTime.parse(tweet.tweetedAt),
                            locale: 'en_short'),
                        style: const TextStyle(
                            fontSize: 17, color: Pallete.greyColor),
                      ),
                    ],
                  ),
                  HashtagOrLinkText(text: tweet.text),
                  if (tweet.tweetType == TweetType.image.name)
                    CarouselImage(imageLinks: tweet.imagesLink),
                  if (tweet.link.isNotEmpty && tweet.imagesLink.isEmpty) ...[
                    const SizedBox(height: 5),
                    AnyLinkPreview(link: 'https://${tweet.link}')
                  ],
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
                                .reshareTweet(tweet, user!, context);
                            //add tweet moi dc tao len tren dau list news
                            ref
                                .read(tweetControllerProvider.notifier)
                                .addTweet(reshareListTweet[1]);
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
                                .likeTweet(tweet, currentUser!.uid);
                            return !isLiked;
                          },
                          isLiked: tweet.likes.contains(currentUser!.uid),
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
