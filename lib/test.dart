import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/detail_tweet_card.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_comment_send_box.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_comment_tile.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

import 'core/presentation/common/loading_page.dart';

const tweetId = '52ace26e-d0b9-495b-9d31-aae5db9e263d';

class TestScreen extends HookConsumerWidget with DismissKeyboard {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweet = ref.watch(singleTweetControllerProvider(tweetId));
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;
    // final currentUserDetail = ref.watch(currentUserDetailsProvider).value;
    final comments = ref.watch(commentTweetProvider);
    final txtCtrl = useTextEditingController();
    final isEmpty =
        useListenableSelector(txtCtrl, () => txtCtrl.text.trim().isEmpty);

    final refreshController = useMemoized(() => RefreshController());

    // useEffect(() {
    //   Future(() => ref
    //       .read(commentTweetProvider.notifier)
    //       .getTweetComments(commentsIds));
    //   return null;
    // }, []);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Tweet'),
      ),
      body: currentUser == null || tweet == null
          ? const Loader()
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GestureDetector(
                          onTap: () => dismiss(),
                          child: SmartRefresher(
                            controller: refreshController,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                DetailTweetCard(
                                    tweet: tweet, currentUser: currentUser),
                                if (comments.tweetComments.isNotEmpty)
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: comments.tweetComments.length,
                                    itemBuilder: (context, index) {
                                      return TweetCommentTile(
                                        comment: comments.tweetComments[index],
                                      );
                                    },
                                  ),
                                // Spacer(),
                                const SizedBox(height: 100)
                              ],
                            ),
                          ),
                        ),
                        TweetCommentSendBox(
                            tweet: tweet, txtCtrl: txtCtrl, isEmpty: isEmpty),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
