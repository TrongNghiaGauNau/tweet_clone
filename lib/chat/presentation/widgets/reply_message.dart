import 'package:flutter/material.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({
    super.key,
    required this.replyMessage,
    required this.currentUid,
    required this.otherUser,
  });

  final Message replyMessage;
  final String currentUid;
  final User otherUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.reply),
              Text(
                'Reply to ${currentUid == replyMessage.senderId ? 'yourself' : otherUser.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5),
          if (replyMessage.message.isNotEmpty)
            Text(
              replyMessage.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          if (replyMessage.imagesIdList.isNotEmpty)
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: replyMessage.imagesIdList.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(replyMessage.imagesIdList[index],
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
