import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/presentation/views/chat_screen.dart';
import 'package:twitter_clone_2/home/presentation/home_view.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  Future<void> getToken() async {
    await ref
        .read(pushNotificationProvider.notifier)
        .getFirebaseMessagingToken();
  }

  @override
  void initState() {
    ref.read(userControllerProvider.notifier).updateActiveStatus(true);
    getToken();
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.toString().contains('resume')) {
        ref.read(userControllerProvider.notifier).updateActiveStatus(true);
      }
      if (message.toString().contains('pause')) {
        ref.read(userControllerProvider.notifier).updateActiveStatus(false);
      }

      return Future.value(message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [HomeView(), ChatScreen()],
      ),
    );
  }
}
