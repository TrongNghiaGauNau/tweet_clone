import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message_state/message_state.dart';

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier({required Message message})
      : _message = message,
        super(MessageState(message: message));

  final Message _message;

  void showSeen(bool isShow) {
    state = state.copyWith(showSeen: !isShow);
  }
}
