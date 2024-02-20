import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/views/detail_chat_screen.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user_ui/user_ui.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    final streamUsers = ref.watch(
        userRepositoryProvider.select((value) => value.getAllUserDemo()));

    List<UserUI> listChatUsers = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: currentUid == null
          ? const Center(child: Text('Can not load chat due to some error'))
          : RefreshIndicator(
              onRefresh: () async {
                return Future.delayed(const Duration(seconds: 1));
              },
              child: StreamBuilder(
                stream: streamUsers.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());

                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      listChatUsers = data
                              ?.map((e) => UserUI.fromJson(
                                  e.data() as Map<String, dynamic>))
                              .toList() ??
                          [];
                  }
                  if (listChatUsers.isEmpty) {
                    return const Center(
                        child: Text('No one yet you have sent message'));
                  }
                  return ListView.builder(
                    itemCount: listChatUsers.length,
                    itemBuilder: (context, index) {
                      return ChatTile(
                          userUI: listChatUsers[index], currentUid: currentUid);
                    },
                  );
                },
              ),
            ),
    );
  }
}

class ChatTile extends ConsumerWidget {
  const ChatTile({super.key, required this.userUI, required this.currentUid});

  final UserUI userUI;
  final String currentUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final messageId = '${currentUid}_${userUI.uid}';
    final messageId = '${userUI.uid}_$currentUid';
    // debugPrint('hehe: $messageId');
    final stream = ref
        .watch(messageDetailNotifierProvider.notifier)
        .getLastMessage(userUI.uid, messageId);
    Message? message;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DetailChatScreen(userUI: userUI, currentUid: currentUid)));
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
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(userUI.profilePic == ''
                          ? defaultAvatar
                          : userUI.profilePic)),
                  title: Text(userUI.name),
                  subtitle: message == null ? null : Text(message!.message),
                  trailing: message == null
                      ? null
                      : Text(
                          timeago.format(DateTime.parse(message!.sentAt),
                              locale: 'en_short'),
                          style: const TextStyle(color: Colors.grey),
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
