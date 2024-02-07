import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

class TweetCommentSendBox extends HookConsumerWidget with DismissKeyboard {
  const TweetCommentSendBox(
      {required this.tweet,
      required this.txtCtrl,
      this.isEmpty = true,
      super.key});

  final TextEditingController txtCtrl;
  final bool isEmpty;
  final Tweet tweet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;
    final isSending = useState(false);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        // border: Border(top: BorderSide(color: Colors.white)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: txtCtrl,
              autofocus: true,
              maxLines: 3,
              minLines: 1,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                  hintText: 'Tweet your comment', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(width: 15),
          isEmpty
              ? sendIcon(Colors.grey)
              : GestureDetector(
                  onTap: isSending.value
                      ? null
                      : () async {
                          if (currentUser == null) {
                            showSnackbar(context,
                                'Something is wrong.Please try back again later');
                            return;
                          }
                          final res = await ref
                              .read(commentTweetProvider.notifier)
                              .sendComment(
                                  tweet: tweet,
                                  images: [],
                                  text: txtCtrl.text,
                                  uid: currentUser.uid,
                                  repliedTo: '');
                          res.fold((l) => debugPrint(l.messsage), (r) {
                            dismiss();
                            ref
                                .read(singleTweetControllerProvider(tweet.id)
                                    .notifier)
                                .updatePost(r);
                            txtCtrl.clear();
                            showSnackbar(context, 'Comment successfully');
                          });
                        },
                  child: sendIcon(isSending.value ? Colors.grey : Colors.blue),
                )
        ],
      ),
    );
  }

  Padding sendIcon(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(
        Icons.send_rounded,
        size: 20,
        color: color,
      ),
    );
  }
}
