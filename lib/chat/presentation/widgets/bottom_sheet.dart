import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/dialog_button.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';

void copy(String text) {
  final data = ClipboardData(text: text);
  Clipboard.setData(data);
}

Future<void> showChatModalBottomSheet(BuildContext context,
    {required Message message, required WidgetRef ref}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (_) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              .copyWith(bottom: 40),
          child: Column(
            children: [
              BottomSheetButton(
                  btnName: 'Copy',
                  icon: const Icon(Icons.copy),
                  onTap: () => copy(message.message)),
              const SizedBox(height: 10),
              BottomSheetButton(
                  btnName: 'Reply',
                  icon: const Icon(Icons.reply),
                  onTap: () {}),
              const SizedBox(height: 10),
              BottomSheetButton(
                  btnName: 'Delete',
                  icon: const Icon(Icons.delete),
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            height: 200,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  'Do you want to delete this',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DialogButton(
                                      btnName: 'OK',
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      onTap: () {
                                        ref
                                            .read(messageStateNotifierProvider(
                                                    message)
                                                .notifier)
                                            .deleteMessage(
                                                myId: message.senderId,
                                                otherId: message.receiverId,
                                                messageId: message.sentAt);
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    const DialogButton(btnName: 'Cancel'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      );
    },
  );
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton(
      {super.key, required this.btnName, required this.icon, this.onTap});

  final String btnName;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [Expanded(child: Text(btnName)), icon]),
      ),
    );
  }
}
