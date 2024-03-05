import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/attachments/shared/providers.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/reply_message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/uploading_chat_attachment_item.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class ChatBar extends HookConsumerWidget {
  const ChatBar({
    super.key,
    required this.textEditingController,
    required this.ref,
    required this.receiverId,
    required this.senderId,
    required this.senderName,
    required this.receiverToken,
    required this.otherUser,
  });

  final TextEditingController textEditingController;
  final WidgetRef ref;
  final String receiverId;
  final String senderId;
  final String senderName;
  final String? receiverToken;
  final User otherUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesList = ref.watch(uploadingAttachmentProvider);
    final isSending = useState(false);
    final replyMessage = ref.watch(replyMessageProvider);

    return Stack(
      children: [
        Column(
          children: [
            const Divider(color: Colors.white),
            if (replyMessage != null)
              ReplyMessage(
                  replyMessage: replyMessage,
                  otherUser: otherUser,
                  currentUid: senderId),
            if (imagesList.isNotEmpty)
              UploadingAttachmentChatItem(files: imagesList),
            if (imagesList.isNotEmpty) const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions,
                                color: Pallete.blueColor)),
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                hintText: 'Type something...',
                                hintStyle: TextStyle(color: Pallete.blueColor),
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                            onPressed: imagesList.length >= 5
                                ? null
                                : () async {
                                    final res = await ref
                                        .read(uploadingAttachmentProvider
                                            .notifier)
                                        .pickChatImages();
                                    if (!res && context.mounted) {
                                      showSnackbar(context,
                                          'You can only pick max to 5 images');
                                    }
                                  },
                            icon: Icon(Icons.image,
                                color: imagesList.length >= 5
                                    ? Pallete.greyColor
                                    : Pallete.blueColor)),
                        IconButton(
                            onPressed: () async {
                              final res = await ref
                                  .read(uploadingAttachmentProvider.notifier)
                                  .takeChatCameraImage();
                              if (!res && context.mounted) {
                                showSnackbar(context,
                                    'You can only pick max to 5 images');
                              }
                            },
                            icon: const Icon(Icons.camera_alt_rounded,
                                color: Pallete.blueColor)),
                      ],
                    ),
                  ),
                ),
                //send button
                GestureDetector(
                  onTap: isSending.value
                      ? null
                      : () async {
                          isSending.value = true;
                          final res = await ref
                              .read(messageDetailNotifierProvider.notifier)
                              .sendMessage(
                                  message: textEditingController.text.isEmpty
                                      ? ''
                                      : textEditingController.text,
                                  receiverId: receiverId,
                                  senderId: senderId,
                                  senderName: senderName,
                                  receiverToken: receiverToken,
                                  imagesList: imagesList,
                                  replyMessage: replyMessage);

                          res.fold((l) => null, (r) {
                            textEditingController.clear();
                            isSending.value = false;
                            ref
                                .read(uploadingAttachmentProvider.notifier)
                                .clear();
                            ref.read(replyMessageProvider.notifier).state =
                                null;
                          });
                        },
                  child: Container(
                    padding: const EdgeInsets.all(10).copyWith(right: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSending.value
                            ? Pallete.greyColor
                            : Pallete.blueColor),
                    child: const Center(
                      child: Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        if (imagesList.isNotEmpty || replyMessage != null)
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                ref.read(uploadingAttachmentProvider.notifier).clear();
                ref.read(replyMessageProvider.notifier).state = null;
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff83878f),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(3),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
