import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/views/detail_chat_screen.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../user_profile/infrastructure/models/user.dart';

class ChatTile extends ConsumerWidget {
  const ChatTile({super.key, required this.user, required this.currentUid});

  final User user;
  final String currentUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref
        .watch(messageDetailNotifierProvider.notifier)
        .getLastMessage(currentUid, user.uid);
    Message? message;
    return GestureDetector(
      onTap: () async {
        final currentUser = await ref
            .read(userControllerProvider.notifier)
            .getUserInfoOnly(currentUid);
        if (currentUser == null) {
          return;
        }
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetailChatScreen(user: user, currentUser: currentUser)));
        }
      },
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              final messagesList =
                  data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
              if (messagesList.isNotEmpty) {
                message = messagesList[0];
              }
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.white),
                ),
                child: ListTile(
                  tileColor: message == null
                      ? Colors.black
                      : message!.senderId != currentUid &&
                              message!.seen == false
                          ? null
                          : Colors.black,
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePic == ''
                          ? defaultAvatar
                          : user.profilePic)),
                  title: Text(user.name),
                  subtitle: message == null
                      ? const Text('Say hi to each other...')
                      : message!.senderId == currentUid
                          ? Text(
                              'You: ${message!.message.isEmpty && message!.imagesIdList.isNotEmpty ? 'Have sent an attachment' : message!.message}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              '${user.name}: ${message!.message.isEmpty && message!.imagesIdList.isNotEmpty ? 'Have sent an attachment' : message!.message}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                  trailing: message == null
                      ? null
                      : message!.senderId == currentUid
                          ? Text(
                              timeago.format(DateTime.parse(message!.sentAt),
                                  locale: 'en_short'),
                              style: const TextStyle(color: Colors.grey),
                            )
                          : message!.seen
                              ? Text(
                                  timeago.format(
                                      DateTime.parse(message!.sentAt),
                                      locale: 'en_short'),
                                  style: const TextStyle(color: Colors.grey),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20)
                                      .copyWith(right: 0),
                                  child: const CircleAvatar(
                                      backgroundColor: Colors.blue),
                                ),
                ),
              );
          }
        },
      ),
    );
    ;
  }
}
