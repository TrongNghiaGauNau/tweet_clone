import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

enum TweetMenuPopupAction {
  delete('Delete'),
  changeStatus('Change status');

  final String text;

  const TweetMenuPopupAction(this.text);
}

class TweetMenuPopup extends ConsumerWidget {
  const TweetMenuPopup({super.key, required this.tweet, this.isPop = false});

  final Tweet tweet;
  final bool isPop;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.square(
      dimension: 40,
      child: PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        splashRadius: 18,
        itemBuilder: (context) {
          return [
            popupMenuItem(
                TweetMenuPopupAction.delete, const Icon(Icons.delete)),
            popupMenuItem(
                TweetMenuPopupAction.changeStatus, const Icon(Icons.settings)),
          ];
        },
        onSelected: (value) async {
          switch (value) {
            case TweetMenuPopupAction.delete:
              await ref
                  .read(tweetControllerProvider.notifier)
                  .deleteTweet(tweet);
              if (isPop) {
                if (context.mounted) {
                  showSnackbar(context, 'Delete tweet successufully');
                  ref.read(userControllerProvider.notifier).getUserDetailInfo(
                      tweet.tweetCreator[TweetCreator.creatorUID] ?? '');
                  Navigator.of(context).pop();
                }
              }
              break;
            case TweetMenuPopupAction.changeStatus:
              //
              break;
          }
        },
      ),
    );
  }

  PopupMenuItem<TweetMenuPopupAction> popupMenuItem(
      TweetMenuPopupAction value, Icon icon) {
    return PopupMenuItem(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      value: value,
      child: Row(
        children: [
          Text(value.text),
          const Spacer(),
          icon,
        ],
      ),
    );
  }
}
