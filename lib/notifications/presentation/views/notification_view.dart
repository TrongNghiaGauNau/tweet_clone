import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/core/presentation/common/error_page.dart';
import 'package:twitter_clone_2/notifications/presentation/widgets/loading_notification.dart';
import 'package:twitter_clone_2/notifications/presentation/widgets/notification_tile.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';

class NotificationView extends HookConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationList = ref.watch(notificationNotifierProvider);

    useEffect(() {
      Future(() =>
          ref.read(notificationNotifierProvider.notifier).getNotifications());
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future(() =>
            ref.read(notificationNotifierProvider.notifier).getNotifications()),
        child: notificationList.when(
          init: () =>
              const Center(child: Text('There is no new notifications')),
          data: (notificationList) {
            return ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                return NotificationTile(notification: notificationList[index]);
              },
            );
          },
          error: () => const ErrorText(
              error: 'Something went wrong. Can not get notifications'),
          empty: () => ListView(
            children: [
              SizedBox(
                  height: useMemoized(
                      () => MediaQuery.of(context).size.height * 0.3)),
              const Center(child: Text('Notification is empty')),
            ],
          ),
          loading: () => const LoadingNotifications(),
        ),
      ),
    );
  }
}
