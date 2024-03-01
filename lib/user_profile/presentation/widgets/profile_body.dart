import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/chat/presentation/views/detail_chat_screen.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/presentation/common/common_loading.dart';
import 'package:twitter_clone_2/core/presentation/common/loading_page.dart';
import 'package:twitter_clone_2/core/presentation/common/rounded_medium_button.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';
import 'package:twitter_clone_2/core/presentation/extension/list_extension.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/presentation/views/tweet_detail.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_card.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/presentation/views/update_profile_screen.dart';
import 'package:twitter_clone_2/user_profile/presentation/widgets/follow_count.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

import '../../../core/application/utils.dart';

class ProfileBody extends HookConsumerWidget with LoadingMixin {
  const ProfileBody({super.key, required this.user, this.userTweet = const []});

  final User? user;
  final List<Tweet> userTweet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUID = ref.watch(firebaseAuthProvider).currentUser?.uid;
    final currentUser = ref.watch(userDetailsProvider(currentUID ?? '')).value;
    final itemSize = useMemoized(() =>
        context.calculateItemSize(numberOfItems: 3, padding: 0, spacing: 6));
    final itemHeightSize = useMemoized(() =>
        context.calculateItemSize(numberOfItems: 3, padding: 0, spacing: 0));
    final tweetsList = useMemoized(
        () => userTweet.splitMatch((tweet) => tweet.imagesLink.isNotEmpty),
        [userTweet]);
    final tweetsWithImages = tweetsList.matched;
    final tweetsNoImages = tweetsList.unmatched;
    final changedBannerPic = useState<File?>(null);
    final isChangeBanner = useState(false);

    void onPickImages() async {
      changedBannerPic.value = await pickImage();
    }

    void changeBannerPic() async {
      isChangeBanner.value = true;
      final asyncTask =
          await ref.read(userControllerProvider.notifier).updateUserBanner(
                user: user!,
                bannerPic: changedBannerPic.value!,
              );

      asyncTask.fold((l) => debugPrint(l.messsage), (r) {
        changedBannerPic.value = null;
        isChangeBanner.value = false;
      });
    }

    double getImageTweetsHeight(int numImages) {
      return itemHeightSize * (numImages <= 3 ? 1 : (numImages - 2) % 3 + 1);
    }

    return user == null
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    changedBannerPic.value == null
                        ? user!.bannerPic.isEmpty
                            ? Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Pallete.blueColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              )
                            : SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    user!.bannerPic,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                        : SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                changedBannerPic.value!,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                    if (isChangeBanner.value)
                      Positioned.fill(
                          child: Container(
                        decoration:
                            BoxDecoration(color: Colors.red.withOpacity(0.5)),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )),
                    Positioned(
                        left: 20,
                        bottom: -50,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user!.profilePic == ''
                                ? defaultAvatar
                                : user!.profilePic),
                            radius: 45,
                          ),
                        )),
                    if (currentUID == user!.uid &&
                        changedBannerPic.value == null)
                      Positioned(
                          right: 10,
                          bottom: 10,
                          child: GestureDetector(
                            onTap: onPickImages,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.image)),
                          )),
                    if (changedBannerPic.value != null)
                      Positioned(
                          right: 10,
                          bottom: 10,
                          child: GestureDetector(
                            onTap: changeBannerPic,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.check)),
                          )),
                    if (changedBannerPic.value != null)
                      Positioned(
                          right: 50,
                          bottom: 10,
                          child: GestureDetector(
                            onTap: () => changedBannerPic.value = null,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.cancel)),
                          )),
                  ],
                ),
                const SizedBox(height: 50),
                Text(user!.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    FollowCount(
                        count: user!.following.length, text: 'Following'),
                    const SizedBox(
                      width: 15,
                    ),
                    FollowCount(
                        count: user!.followers.length, text: 'Followers'),
                  ],
                ),
                const SizedBox(height: 5),
                if (user!.bio.isNotEmpty)
                  Text(user!.bio, style: const TextStyle(fontSize: 15)),
                if (user!.bio.isNotEmpty) const SizedBox(height: 5),
                Row(
                  children: [
                    RoundedMediaButton(
                      onTap: currentUID == user!.uid
                          ? () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UpdateProfileScreen(user: user!),
                              ))
                          : () async {
                              if (currentUser != null) {
                                ref
                                    .read(userControllerProvider.notifier)
                                    .followUser(
                                        followedUser: user!,
                                        context: context,
                                        currentUser: currentUser);

                                // ref
                                //     .read(tweetControllerProvider.notifier)
                                //     .getTweets(ref);
                              }
                            },
                      label: currentUID == user!.uid
                          ? 'Edit Profile'
                          : currentUser == null
                              ? 'Error'
                              : user!.followers.contains(currentUser.uid)
                                  ? 'Unfollow'
                                  : 'Follow',
                      backgroundColor: Pallete.blueColor,
                      textColor: Pallete.whiteColor,
                    ),
                    const SizedBox(width: 10),
                    if (currentUID != user!.uid)
                      RoundedMediaButton(
                        onTap: () {
                          if (currentUser == null || user == null) {
                            return;
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailChatScreen(
                                  user: user!, currentUser: currentUser)));
                          //add this user to chat list
                          ref
                              .read(messageDetailNotifierProvider.notifier)
                              .addUserToChatList(currentUser.uid, user!.uid);
                        },
                        label: 'Message',
                        backgroundColor: Pallete.whiteColor,
                        textColor: Pallete.backgroundColor,
                      ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(color: Pallete.whiteColor),
                const TabBar(
                  indicatorColor: Pallete.blueColor,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.image),
                    ),
                    Tab(
                      icon: Icon(Icons.app_registration_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: getImageTweetsHeight(tweetsWithImages.length),
                  child: TabBarView(
                    children: [
                      ImageTweets(
                          tweetsWithImages: tweetsWithImages,
                          context: context,
                          itemSize: itemSize),
                      ListView.builder(
                        itemCount: tweetsNoImages.length,
                        itemBuilder: (context, index) {
                          return TweetCard(tweetData: tweetsNoImages[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class ImageTweets extends HookWidget {
  const ImageTweets({
    super.key,
    required this.tweetsWithImages,
    required this.context,
    required this.itemSize,
  });

  final Iterable<Tweet> tweetsWithImages;
  final BuildContext context;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 6.0,
      runSpacing: 6.0,
      children: tweetsWithImages.mapWithIndex((tweet, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TwitterDetailScreen(tweetId: tweet.id),
          )),
          child: SizedBox(
            width: itemSize,
            height: itemSize,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    tweet.imagesLink[0],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                  ),
                ),
                if (tweet.imagesLink.length > 1)
                  const Positioned(
                      top: 2, right: 5, child: Icon(Icons.file_copy_rounded))
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
