import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/application/chat_notifier.dart';
import 'package:twitter_clone_2/chat/application/message_notifier.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/chat_list_state/chat_list_state.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message_state/message_state.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/notifications/shared/providers.dart';

final messageDetailNotifierProvider =
    StateNotifierProvider<ChatNotifier, ChatListState>((ref) {
  return ChatNotifier(
      chatRepository: ref.watch(chatRepository),
      pushNotificationNotifier: ref.watch(pushNotificationProvider.notifier));
});

final messageStateNotifierProvider = StateNotifierProvider.family
    .autoDispose<MessageNotifier, MessageState, Message>((ref, message) {
  return MessageNotifier(message: message);
});

final isInChatProvider = StateProvider<bool>((ref) => false);
