import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/presentation/views/tweet_detail.dart';
import 'package:twitter_clone_2/tweet/shared/providers.dart';

class NotificationTile extends HookConsumerWidget {
  const NotificationTile({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sender = ref.watch(singleInAppNotificationProvider);
    final tweet = ref.watch(singleTweetControllerProvider(notification.postId));

    useEffect(() {
      Future(() => ref
          .read(singleInAppNotificationProvider.notifier)
          .getUserInfoDetail(notification.senderID));
    }, const []);

    return sender == null
        ? errorNoti()
        : GestureDetector(
            onTap: () {
              if (tweet == null) return;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TwitterDetailScreen(
                    tweetId: notification.postId,
                    commentsIds: tweet.commentsIds),
              ));
            },
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Pallete.blueColor)),
                    child: Image.network(
                      sender.profilePic,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Flexible(
                        child: Text(
                          sender.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(notification.text),
                    ],
                  ),
                ),
                const Divider(color: Pallete.blueColor, thickness: 0.5),
              ],
            ),
          );
  }

  Container errorNoti() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
          child: Text('Can not load this notificaiotn due to some error')),
    );
  }
}
