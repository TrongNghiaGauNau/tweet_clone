import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/attachments/infratruscture/model/attachment/attachment.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';

class ChatRepository {
  final _chatRepo = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _userRepo = FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllMessages(String chatId) {
    try {
      //chat -> chatId -> take all here
      final ref = _chatRepo
          .collection('chat')
          .doc(chatId)
          .collection(chatId)
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

  Either<Failure, void> sendMessage(
      {required Message message, required String chatId}) {
    try {
      //chat -> chatId -> sentAt(messageId)
      final toSendMsg = _chatRepo
          .collection('chat')
          .doc(chatId)
          .collection(chatId)
          .doc(message.id);

      toSendMsg.set(message.toJson());
      _chatRepo
          .collection('chat_list')
          .doc(message.senderId)
          .collection('my_chat_list')
          .doc(message.receiverId)
          .set({'new_chat': DateTime.now().toIso8601String()});
      _chatRepo
          .collection('chat_list')
          .doc(message.receiverId)
          .collection('my_chat_list')
          .doc(message.senderId)
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

  Stream<QuerySnapshot<Map<String, dynamic>>>? getLastMessage(String chatId) {
    try {
      final ref = _chatRepo
          .collection('chat')
          .doc(chatId)
          .collection(chatId)
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
    required String chatId,
    required String messageId,
  }) async {
    //update message in my chat
    await _chatRepo
        .collection('chat')
        .doc(chatId)
        .collection(chatId)
        .doc(messageId)
        .update({'seen': true});
  }

  void deleteMessage({
    required String myId,
    required String otherId,
    required String messageId,
  }) {
    try {
      final myChatId = '${myId}_$otherId';
      final otherChatId = '${otherId}_$myId';
      //del message in my chat
      _chatRepo
          .collection('chat')
          .doc(myId)
          .collection(myChatId)
          .doc(messageId)
          .delete();
      //del message in other chat
      _chatRepo
          .collection('chat')
          .doc(otherId)
          .collection(otherChatId)
          .doc(messageId)
          .delete();
    } catch (e) {
      debugPrint('delete error: $e');
    }
  }

  void uploadChatImages({
    required String chatId,
    required Attachment attachment,
  }) {
    try {
      // _chatRepo
      //     .collection('chat')
      //     .doc(chatId)
      //     .collection('chat_images')
      //     .doc('chat_images')
      //     .set({'images_list': imagesList});
      _chatRepo
          .collection('chat')
          .doc(chatId)
          .collection('chat_images')
          .doc(attachment.id)
          .set(attachment.toJson());
    } catch (e) {
      debugPrint('upload_chat_images_error: $e');
    }
  }

  Future<List<Attachment>?> getChatImages(String chatId) async {
    try {
      final doc = await _chatRepo
          .collection('chat')
          .doc(chatId)
          .collection('chat_images')
          .get();
      final data = doc.docs;

      // final List<dynamic> imagesList = [];
      // imagesList.addAll(data['images_list']);

      final imagesList =
          data.map((e) => Attachment.fromJson(e.data())).toList();

      return imagesList;
    } catch (error) {
      debugPrint('chat_error get chat images: $error');
      return null;
    }
  }
}
