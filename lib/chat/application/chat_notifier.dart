import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/chat_repository.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';

class ChatNotifier extends StateNotifier<void> {
  ChatNotifier({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(null);

  final ChatRepository _chatRepository;

  FutureEither<void> sendMessage({
    required String message,
    required MessageType messageType,
    required String receiverId,
    required String senderId,
  }) async {
    final myMessage = Message(
      id: '${senderId}_$receiverId',
      receiverId: receiverId,
      senderId: senderId,
      message: message,
      sentAt: DateTime.now().toIso8601String(),
      messageType: messageType,
    );
    final otherMessage = Message(
      id: '${receiverId}_$senderId',
      receiverId: receiverId,
      senderId: senderId,
      message: message,
      sentAt: DateTime.now().toIso8601String(),
      messageType: messageType,
    );
    final res = await _chatRepository.sendMessage(
        myMessage: myMessage, otherMessage: otherMessage);
    res.fold((l) => debugPrint(l.messsage), (r) => null);
    return res;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllMessages(
      String userId, String messageId) {
    try {
      return _chatRepository.getAllMessages(userId, messageId);
    } catch (e) {
      debugPrint('chat_error: $e');
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getLastMessage(
      String userId, String messageId) {
    try {
      return _chatRepository.getLastMessage(userId, messageId);
    } catch (e) {
      debugPrint('chat_error: $e');
      return null;
    }
  }
}
