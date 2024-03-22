import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/chat_bar.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/detail_chat_app_bar.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/message_card.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class DetailChatScreen extends HookConsumerWidget {
  const DetailChatScreen(
      {super.key, required this.user, required this.currentUser});

  final User user;
  final User currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> messList = [];
    final allMessage = ref
        .watch(messageDetailNotifierProvider.notifier)
        .getAllMessages(currentUser.uid, user.uid);
    final activeUserInfo =
        ref.watch(userControllerProvider.notifier).getUserOnlineInfo(user.uid);

    final itemScrollController = useMemoized(() => ItemScrollController());

    //watch chatMember here so i will not dispose only if get out of chat screen
    final chatMember = ref.watch(chatMemeberProvider);

    useEffect(() {
      Future(() {
        ref.read(chatIdProvider.notifier).state =
            getUniqueIdFrom2String(currentUser.uid, user.uid);

        ref.read(isInChatProvider.notifier).state = true;

        Future(() => ref
            .read(chatMemeberProvider.notifier)
            .getChatMembers([currentUser.uid, user.uid]));
      });
      return null;
    }, []);

    void handleOnQuotedMessageTap(Message quoteMessage, List<String> list) {
      final index = list.indexOf(quoteMessage.sentAt);
      if (index != -1) {
        ref.read(focusMessageIdProvider.notifier).state = quoteMessage.sentAt;
        itemScrollController.jumpTo(index: index);
      }
    }

    ref.listen<Message?>(onQuotedMessageProvider, (_, message) {
      if (message != null) {
        handleOnQuotedMessageTap(message, messList);
        ref.read(onQuotedMessageProvider.notifier).state = null;
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: DetailChatAppBar(
              user: user,
              context: context,
              activeUserInfo: activeUserInfo,
              ref: ref),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: allMessage,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());

                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      final messagesList = data
                              ?.map((e) => Message.fromJson(e.data()))
                              .toList() ??
                          [];
                      messList = messagesList.reversed
                          .map((message) => message.sentAt)
                          .toList();
                      if (messagesList.isEmpty) {
                        return const Center(
                            child: Text(
                          'Say Hi...',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ));
                      }

                      //to prevent bouncing
                      final reverseMessageList = messagesList.reversed.toList();

                      return ScrollablePositionedList.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: messagesList.length,
                        itemScrollController: itemScrollController,
                        addAutomaticKeepAlives: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return MessageCard(
                              message: reverseMessageList[index]);
                        },
                      );
                  }
                },
              ),
            ),
            ChatBar(
              ref: ref,
              receiverId: user.uid,
              senderId: currentUser.uid,
              senderName: currentUser.name,
              receiverToken: user.fcmToken,
              otherUser: user,
            ),
          ],
        ),
      ),
    );
  }
}
