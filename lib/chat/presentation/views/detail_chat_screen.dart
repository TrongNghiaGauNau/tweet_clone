import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/message_card.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class DetailChatScreen extends HookConsumerWidget {
  const DetailChatScreen(
      {super.key, required this.user, required this.currentUser});

  final User user;
  final User currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageId = '${currentUser.uid}_${user.uid}';
    final allMessage = ref
        .watch(messageDetailNotifierProvider.notifier)
        .getAllMessages(currentUser.uid, messageId);

    final textController = useTextEditingController();
    final activeUserInfo =
        ref.watch(userControllerProvider.notifier).getUserOnlineInfo(user.uid);

    useEffect(() {
      Future(() => ref.read(isInChatProvider.notifier).state = true);
      return null;
    }, []);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(context, activeUserInfo, ref),
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
                    final messagesList =
                        data?.map((e) => Message.fromJson(e.data())).toList() ??
                            [];
                    if (messagesList.isEmpty) {
                      return const Center(
                          child: Text(
                        'Say Hi...',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ));
                    }
                    return ListView.builder(
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return MessageCard(message: messagesList[index]);
                      },
                    );
                }
              },
            )),
            _chatBar(
              textController,
              ref,
              user.uid,
              currentUser.uid,
              currentUser.name,
              user.fcmToken,
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(
      BuildContext context,
      Stream<QuerySnapshot<Map<String, dynamic>>> activeUserInfo,
      WidgetRef ref) {
    return StreamBuilder(
      stream: activeUserInfo,
      builder: (context, snapshot) {
        final data = snapshot.data?.docs;
        final userInfo = data?.map((e) => User.fromJson(e.data())).toList();
        const offline = ' Online';
        return Row(
          children: [
            IconButton(
              onPressed: () {
                ref.read(isInChatProvider.notifier).state = false;
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Pallete.whiteColor),
              splashRadius: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                user.profilePic,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                  backgroundColor: Pallete.whiteColor,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (userInfo != null)
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: userInfo[0].isOnline
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 5),
                      Text(userInfo.isNotEmpty
                          ? userInfo[0].isOnline
                              ? 'Online'
                              : userInfo[0].lastActive.isEmpty
                                  ? 'Offline'
                                  : 'Last seen ${timeago.format(DateTime.parse(userInfo[0].lastActive), locale: 'en_short')}'
                          : 'Offline')
                    ],
                  )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _chatBar(
      TextEditingController textEditingController,
      WidgetRef ref,
      String receiverId,
      String senderId,
      String senderName,
      String? receiverToken) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    onPressed: () {},
                    icon: const Icon(Icons.image, color: Pallete.blueColor)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded,
                        color: Pallete.blueColor)),
              ],
            ),
          ),
        ),
        //send button
        GestureDetector(
          onTap: () async {
            if (textEditingController.text.isNotEmpty) {
              await ref
                  .read(messageDetailNotifierProvider.notifier)
                  .sendMessage(
                    message: textEditingController.text,
                    messageType: MessageType.text,
                    receiverId: receiverId,
                    senderId: senderId,
                    senderName: senderName,
                    receiverToken: receiverToken,
                  );
            }
            textEditingController.clear();
          },
          child: Container(
            padding: const EdgeInsets.all(10).copyWith(right: 5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Pallete.blueColor),
            child: const Center(
              child: Icon(Icons.send),
            ),
          ),
        ),
      ],
    );
  }
}
