import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageCard extends HookConsumerWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    return currentUid == message.senderId
        ? MyMessage(message: message)
        : OtherMessage(message: message);
  }
}

class MyMessage extends HookConsumerWidget {
  const MyMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              timeago.format(DateTime.parse(message.sentAt),
                  locale: 'en_short'),
              style: const TextStyle(color: Colors.white54),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * (2 / 3),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
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
        ],
      ),
    );
  }
}

class OtherMessage extends HookConsumerWidget {
  const OtherMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
