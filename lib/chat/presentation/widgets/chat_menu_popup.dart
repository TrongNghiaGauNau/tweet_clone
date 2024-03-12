import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/presentation/chat_list_files_screen.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';

enum ChatMenuPopupAction {
  files('Files'),
  block('Block this user'),
  disableNotification('Change notification status');

  final String text;

  const ChatMenuPopupAction(this.text);
}

class ChatMenuPopup extends ConsumerWidget {
  const ChatMenuPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatId = ref.watch(chatIdProvider);
    return SizedBox.square(
      dimension: 40,
      child: PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        splashRadius: 18,
        itemBuilder: (context) {
          return [
            popupMenuItem(ChatMenuPopupAction.files, const Icon(Icons.image)),
            popupMenuItem(ChatMenuPopupAction.block, const Icon(Icons.block)),
            popupMenuItem(ChatMenuPopupAction.disableNotification,
                const Icon(Icons.notifications)),
          ];
        },
        onSelected: (value) async {
          switch (value) {
            case ChatMenuPopupAction.files:
              if (chatId != null) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatListFilesScreen(chatId: chatId),
                ));
              }
              break;
            case ChatMenuPopupAction.block:
              //
              break;
            case ChatMenuPopupAction.disableNotification:
              //
              break;
          }
        },
      ),
    );
  }

  PopupMenuItem<ChatMenuPopupAction> popupMenuItem(
      ChatMenuPopupAction value, Icon icon) {
    return PopupMenuItem(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      value: value,
      child: Row(
        children: [
          Expanded(child: Text(value.text)),
          icon,
        ],
      ),
    );
  }
}
