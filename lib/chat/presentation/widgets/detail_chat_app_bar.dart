import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

import '../../../user_profile/infrastructure/models/user.dart';

class DetailChatAppBar extends StatelessWidget with TimeFormat {
  const DetailChatAppBar({
    super.key,
    required this.user,
    required this.context,
    required this.activeUserInfo,
    required this.ref,
  });

  final User user;
  final BuildContext context;
  final Stream<QuerySnapshot<Map<String, dynamic>>> activeUserInfo;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: activeUserInfo,
      builder: (context, snapshot) {
        final data = snapshot.data?.docs;
        final userInfo = data?.map((e) => User.fromJson(e.data())).toList();
        const offline = ' Offline';
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
                                  ? offline
                                  : 'Last seen ${timeAgo(userInfo[0].lastActive) == 'now' ? 'just now' : timeAgo(userInfo[0].lastActive)}'
                          : offline)
                    ],
                  )
              ],
            ),
          ],
        );
      },
    );
  }
}
