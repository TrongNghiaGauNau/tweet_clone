import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';

class ChatRepository {
  final _chatRepo = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllMessages(
      String userId, String messageId) {
    try {
      final ref = _chatRepo
          .collection('chat')
          .doc(userId)
          .collection(messageId)
          .snapshots();

      return ref;
    } on FirebaseException catch (e) {
      debugPrint('chat_api: ${e.message ?? 'Some unexpected error occured'}');
      return null;
    } catch (e) {
      debugPrint('chat_api: ${e.toString()}');
      return null;
    }
  }

  FutureEitherVoid sendMessage(
      {required Message myMessage, required Message otherMessage}) async {
    try {
      final senderMsg = _chatRepo
          .collection('chat')
          .doc(myMessage.senderId)
          .collection(myMessage.id);
      final receiverMsg = _chatRepo
          .collection('chat')
          .doc(otherMessage.receiverId)
          .collection(otherMessage.id);

      await senderMsg.doc(myMessage.sentAt).set(myMessage.toJson());
      await receiverMsg.doc(otherMessage.sentAt).set(otherMessage.toJson());
      return right(null);
    } on FirebaseException catch (e, st) {
      debugPrint('chat_api: ${e.message ?? 'Some unexpected error occured'}');
      return left(Failure(e.message ?? 'Some unexpected error occured', st));
    } catch (e, st) {
      debugPrint('chat_api: ${e.toString()}');
      return left(Failure(e.toString(), st));
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getLastMessage(
      String userId, String messageId) {
    try {
      final ref = _chatRepo
          .collection('chat')
          .doc(userId)
          .collection(messageId)
          .orderBy('sentAt', descending: true)
          .limit(1)
          .snapshots();

      return ref;
    } on FirebaseException catch (e) {
      debugPrint('chat_api: ${e.message ?? 'Some unexpected error occured'}');
      return null;
    } catch (e) {
      debugPrint('chat_api: ${e.toString()}');
      return null;
    }
  }
}
