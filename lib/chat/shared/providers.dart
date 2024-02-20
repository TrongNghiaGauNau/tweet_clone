import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/application/chat_notifier.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';

final messageDetailNotifierProvider =
    StateNotifierProvider<ChatNotifier, void>((ref) {
  return ChatNotifier(chatRepository: ref.watch(chatRepository));
});
