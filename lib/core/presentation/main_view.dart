import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/presentation/views/chat_screen.dart';
import 'package:twitter_clone_2/home/presentation/home_view.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        children: const [HomeView(), ChatScreen()],
      ),
    );
  }
}
