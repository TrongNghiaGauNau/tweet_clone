import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/chat_tile.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    final streamUsers =
        ref.watch(messageDetailNotifierProvider.notifier).getAllChatUsers();
    final chatList = ref.watch(messageDetailNotifierProvider);
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
                stream: streamUsers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listChatUsers =
                        snapshot.data?.docs.map((e) => e.id).toList() ?? [];
                    if (listChatUsers.isEmpty) {
                      return const Center(
                          child: Text('Start chatting with someone'));
                    }

                    return HookBuilder(builder: (context) {
                      useEffect(() {
                        Future(() => ref
                            .read(messageDetailNotifierProvider.notifier)
                            .getAllChat(listChatUsers));
                        return null;
                      }, []);

                      return chatList.when(
                          init: () => const Center(
                              child: Text('Start chatting with someone')),
                          data: (chatList) {
                            return ListView.builder(
                              itemCount: chatList.length,
                              itemBuilder: (context, index) {
                                return ChatTile(
                                    user: chatList[index],
                                    currentUid: currentUid);
                              },
                            );
                          },
                          error: () => const Center(
                              child: Text(
                                  'Error happended when trying to get chat list')),
                          empty: () => const Center(
                              child: Text('There is no one u have contacted')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()));
                    });
                    // return StreamBuilder(
                    //   stream: streamChatList,
                    //   builder: (context, snapshot) {
                    //     final List<User>? listChat =
                    //         snapshot.data?.docs.map((e) {
                    //       return User.fromJson(e.data());
                    //     }).toList();
                    //     debugPrint('hehe listChat: $listChat');
                    //     if (listChat == null) {
                    //       return const Center(
                    //           child: Text('Start chatting with someone'));
                    //     }
                    //     return ListView.builder(
                    //       itemCount: listChat.length,
                    //       itemBuilder: (context, index) {
                    //         return ChatTile(
                    //             user: listChat[index], currentUid: currentUid);
                    //       },
                    //     );
                    //   },
                    // );
                  }
                  return const Center(
                      child: Text('No one yet you have sent message'));
                },
              ),
            ),
    );
  }
}
