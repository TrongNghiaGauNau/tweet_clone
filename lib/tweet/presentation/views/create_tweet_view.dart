import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/presentation/common/common_loading.dart';
import 'package:twitter_clone_2/core/presentation/common/loading_page.dart';
import 'package:twitter_clone_2/core/presentation/common/rounded_small_button.dart';
import 'package:twitter_clone_2/core/presentation/constants/assets_constants.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

class CreateTweetScreen extends HookConsumerWidget with LoadingMixin {
  const CreateTweetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;
    final user = ref.watch(userDetailsProvider(currentUser?.uid ?? '')).value;
    final tweetTextController = useTextEditingController();
    final images = useState<List<File>>([]);
    final isLoading =
        ref.watch(tweetControllerProvider.select((value) => value.isLoading));

    void onPickImages() async {
      images.value = await pickImages();
    }

    void shareTweet() async {
      if (tweetTextController.text.isEmpty) {
        showSnackbar(context, 'Please enter text');
        return;
      }
      final asyncTask = ref
          .read(tweetControllerProvider.notifier)
          .shareTweet(images: images.value, text: tweetTextController.text);

      final res = await doAsyncTask(context, asyncTask: asyncTask);
      if (res == null) {
        if (context.mounted) {
          showSnackbar(context,
              'Something went wrong when trying to publish this tweet');
        }
        return;
      }
      res.fold((l) {
        showSnackbar(context, l.messsage);
        debugPrint(l.messsage);
      }, (r) {
        ref.read(tweetControllerProvider.notifier).addTweet(r);
        if (context.mounted) {
          showSnackbar(context, 'Upload tweet successfully');
          Navigator.of(context).pop();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
          actions: [
            RoundedSmallButton(
                onTap: shareTweet,
                label: 'Tweet',
                backgroundColor: Pallete.blueColor,
                textColor: Pallete.whiteColor),
          ]),
      body: isLoading || currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              (user?.profilePic == null ||
                                      user?.profilePic == '')
                                  ? defaultAvatar
                                  : user!.profilePic),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: tweetTextController,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'What\'s happening?',
                              hintStyle: TextStyle(
                                  color: Pallete.greyColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                    if (images.value.isNotEmpty)
                      CarouselSlider(
                          items: images.value.map(
                            (file) {
                              return Container(
                                width: useMemoized(
                                    () => MediaQuery.of(context).size.width),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.file(file),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            height: 400,
                            enableInfiniteScroll: false,
                          )),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: Pallete.greyColor, width: 0.3),
        )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: GestureDetector(
                  onTap: () => onPickImages(),
                  child: SvgPicture.asset(AssetsConstants.galleryIcon)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SvgPicture.asset(AssetsConstants.gifIcon),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SvgPicture.asset(AssetsConstants.emojiIcon),
            ),
          ],
        ),
      ),
    );
  }
}
