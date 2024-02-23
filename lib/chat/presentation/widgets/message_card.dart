import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageCard extends HookConsumerWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    if (currentUid == null) {
      return const Text('Can not get this message due to some error');
    }
    return currentUid == message.senderId
        ? MyMessage(message: message)
        : OtherMessage(message: message, currentUID: currentUid);
  }
}

class MyMessage extends HookConsumerWidget {
  const MyMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow = ref.watch(messageStateNotifierProvider(message)
        .select((value) => value.showSeen));
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  timeago.format(DateTime.parse(message.sentAt),
                      locale: 'en_short'),
                  style: const TextStyle(color: Colors.white54),
                ),
                if (isShow && message.seen)
                  const Text('seen',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * (2 / 3),
            ),
            child: GestureDetector(
              onTap: () => ref
                  .read(messageStateNotifierProvider(message).notifier)
                  .showSeen(isShow),
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
                child: Text(
                  message.message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OtherMessage extends HookConsumerWidget {
  const OtherMessage({
    super.key,
    required this.message,
    required this.currentUID,
  });

  final Message message;
  final String currentUID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInChat = ref.watch(isInChatProvider);
    useEffect(() {
      if (isInChat && message.seen == false) {
        ref.read(messageDetailNotifierProvider.notifier).updateMessage(
            myId: currentUID, otherId: message.senderId, message: message);
      }
      return null;
    }, []);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * (2 / 3),
            ),
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
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              timeago.format(DateTime.parse(message.sentAt),
                  locale: 'en_short'),
              style: const TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}
