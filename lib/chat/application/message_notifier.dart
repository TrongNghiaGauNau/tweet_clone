import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/chat_repository.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message_state/message_state.dart';

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier(
      {required Message message, required ChatRepository chatRepository})
      : _message = message,
        _chatRepository = chatRepository,
        super(MessageState(message: message));

  final Message _message;
  final ChatRepository _chatRepository;

  void showSeen(bool isShow) {
    state = state.copyWith(showSeen: !isShow);
  }

  void deleteMessage(
      {required String myId,
      required String otherId,
      required String messageId}) {
    _chatRepository.deleteMessage(
      myId: myId,
      otherId: otherId,
      messageId: messageId,
    );
  }
}
