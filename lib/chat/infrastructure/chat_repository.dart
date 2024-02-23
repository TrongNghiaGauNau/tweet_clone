import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';

class ChatRepository {
  final _chatRepo = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _userRepo = FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllMessages(
      String userId, String messageId) {
    try {
      final ref = _chatRepo
          .collection('chat')
          .doc(userId)
          .collection(messageId)
          .orderBy('sentAt')
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
      //reset timeline on my new chat
      _chatRepo
          .collection('chat_list')
          .doc(myMessage.senderId)
          .collection('my_chat_list')
          .doc(myMessage.receiverId)
          .set({'new_chat': DateTime.now().toIso8601String()});
      //reset timeline on the one i chat to  new chat
      _chatRepo
          .collection('chat_list')
          .doc(myMessage.receiverId)
          .collection('my_chat_list')
          .doc(myMessage.senderId)
          .set({'new_chat': DateTime.now().toIso8601String()});

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

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllChatUsers() {
    try {
      final userId = _firebaseAuth.currentUser?.uid ?? '';
      final ref = _chatRepo
          .collection('chat_list')
          .doc(userId)
          .collection('my_chat_list')
          .orderBy('new_chat', descending: true)
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

  FutureEither<void> addUserToChatList(String userId, String chatUserId) async {
    try {
      await _chatRepo
          .collection('chat_list')
          .doc(userId)
          .collection('my_chat_list')
          .doc(chatUserId)
          .set({'new_chat': DateTime.now().toIso8601String()});

      return right(null);
    } on FirebaseException catch (e, stackTrace) {
      return left(Failure(
          'chat_api: ${e.message ?? 'Some unexpected error occured'}',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>>? getAllChat(
      List<String> listChat) {
    try {
      final ref = _userRepo.where('uid', whereIn: listChat).get();

      return ref;
    } on FirebaseException catch (e) {
      debugPrint('user_api: ${e.message ?? 'Some unexpected error occured'}');
      return null;
    } catch (e) {
      debugPrint('user_api: ${e.toString()}');
      return null;
    }
  }

  FutureVoid setSeenMessage({
    required String myId,
    required String otherId,
    required Message message,
  }) async {
    final myChatId = '${myId}_$otherId';
    final otherChatId = '${otherId}_$myId';
    //update message in my chat
    await _chatRepo
        .collection('chat')
        .doc(myId)
        .collection(myChatId)
        .doc(message.sentAt)
        .update({'seen': true});
    //update message in other chat
    await _chatRepo
        .collection('chat')
        .doc(otherId)
        .collection(otherChatId)
        .doc(message.sentAt)
        .update({'seen': true});
  }
}
