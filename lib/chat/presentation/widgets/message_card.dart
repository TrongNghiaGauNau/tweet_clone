import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter_clone_2/attachments/presentation/list_files_view.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/animated_focus.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/bottom_sheet.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/reply_part.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/swipe_reply.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';

class MessageCard extends HookConsumerWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    final itemSize = (context.screenWidth * (2 / 3) - 20 * 2 - 5 * (2 - 1)) / 2;
    if (currentUid == null) {
      return const Text('Can not get this message due to some error');
    }
    return AnimatedFocusWrapper(
      messageId: message.sentAt,
      child: SwipeReply(
        initAlign: currentUid == message.senderId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        reply: () {
          ref.read(replyMessageProvider.notifier).state = message;
        },
        child: currentUid == message.senderId
            ? MyMessage(message: message, itemSize: itemSize)
            : OtherMessage(
                message: message, currentUID: currentUid, itemSize: itemSize),
      ),
    );
  }
}

class MyMessage extends HookConsumerWidget with TimeFormat {
  const MyMessage({super.key, required this.message, required this.itemSize});

  final Message message;
  final double itemSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow = ref.watch(messageStateNotifierProvider(message)
        .select((value) => value.showSeen));
    final showSentTime = useState(false);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showSentTime.value)
            Align(
              alignment: Alignment.center,
              child: Text(
                timeAgo(message.sentAt),
                style: const TextStyle(color: Colors.white54),
              ),
            ),
          if (message.replyMessage != null)
            ReplyPart(message: Message.fromJson(message.replyMessage!)),
          Transform.translate(
            offset: Offset(2, message.replyMessage != null ? -20 : 0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.screenWidth * (2 / 3),
                ),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(messageStateNotifierProvider(message).notifier)
                        .showSeen(isShow);
                    showSentTime.value = !showSentTime.value;
                  },
                  onLongPress: () async {
                    await showChatModalBottomSheet(context,
                        ref: ref, message: message);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isShow ? Colors.blue[800] : Colors.blueAccent,
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (message.imagesIdList.isNotEmpty)
                          Wrap(
                              runSpacing: 5,
                              spacing: 5,
                              children: message.imagesIdList
                                  .mapWithIndex((imageLink, index) =>
                                      GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ListFilesView(
                                              initialIndex: index,
                                              imagesList: message.imagesIdList,
                                              createAt: message.sentAt),
                                        )),
                                        child: Container(
                                          height: itemSize,
                                          width: itemSize,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Image.network(
                                            imageLink,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: SizedBox(
                                                  width: itemSize,
                                                  height: itemSize,
                                                  child: const Card(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ))
                                  .toList()),
                        if (message.imagesIdList.isNotEmpty)
                          const SizedBox(height: 5),
                        if (message.message.isNotEmpty)
                          Text(
                            message.message,
                            style: const TextStyle(color: Colors.white),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isShow && message.seen)
            Transform.translate(
              offset: Offset(2, message.replyMessage != null ? -20 : 0),
              child: const Text('seen',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
            )
        ],
      ),
    );
  }
}

class OtherMessage extends HookConsumerWidget with TimeFormat {
  const OtherMessage({
    super.key,
    required this.message,
    required this.currentUID,
    required this.itemSize,
  });

  final Message message;
  final String currentUID;
  final double itemSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInChat = ref.watch(isInChatProvider);
    final showSentTime = useState(false);
    useEffect(() {
      if (isInChat && message.seen == false) {
        ref.read(messageDetailNotifierProvider.notifier).updateMessage(
            myId: currentUID, otherId: message.senderId, message: message);
      }
      return null;
    }, []);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showSentTime.value)
          Align(
            alignment: Alignment.center,
            child: Text(
              timeAgo(message.sentAt),
              style: const TextStyle(color: Colors.white54),
            ),
          ),
        if (message.replyMessage != null)
          ReplyPart(
              message: Message.fromJson(message.replyMessage!), isMine: false),
        Transform.translate(
          offset: Offset(0, message.replyMessage != null ? -20 : 0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth * (2 / 3),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showSentTime.value = !showSentTime.value;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.amber),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.imagesIdList.isNotEmpty)
                            Wrap(
                                runSpacing: 5,
                                spacing: 5,
                                children: message.imagesIdList
                                    .mapWithIndex((imageLink, index) =>
                                        GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ListFilesView(
                                                initialIndex: index,
                                                imagesList:
                                                    message.imagesIdList,
                                                createAt: message.sentAt),
                                          )),
                                          child: Container(
                                            height: itemSize,
                                            width: itemSize,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Image.network(
                                              imageLink,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: SizedBox(
                                                    width: itemSize,
                                                    height: itemSize,
                                                    child: const Card(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ))
                                    .toList()),
                          if (message.imagesIdList.isNotEmpty)
                            const SizedBox(height: 5),
                          if (message.message.isNotEmpty)
                            Text(
                              message.message,
                              style: const TextStyle(color: Colors.black),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
