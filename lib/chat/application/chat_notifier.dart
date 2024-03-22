import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/application/chat_images_notifier.dart';
import 'package:twitter_clone_2/attachments/infratruscture/model/attachment/attachment.dart';
import 'package:twitter_clone_2/chat/infrastructure/chat_repository.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/chat_list_state/chat_list_state.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/application/push_notification_notifier.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:uuid/uuid.dart';

class ChatNotifier extends StateNotifier<ChatListState> {
  ChatNotifier({
    required ChatRepository chatRepository,
    required PushNotificationNotifier pushNotificationNotifier,
    required ChatImagesNotifier chatImagesNotifier,
  })  : _chatRepository = chatRepository,
        _pushNotificationNotifier = pushNotificationNotifier,
        _chatImagesNotifier = chatImagesNotifier,
        super(const ChatListState.init());

  final ChatRepository _chatRepository;
  final PushNotificationNotifier _pushNotificationNotifier;
  final ChatImagesNotifier _chatImagesNotifier;

  FutureEither<void> sendMessage({
    required String content,
    required String receiverId,
    required String senderId,
    required String senderName,
    required String? receiverToken,
    Message? replyMessage,
    List<File> imagesList = const [],
  }) async {
    final chatId = getUniqueIdFrom2String(senderId, receiverId);
    final now = DateTime.now().toIso8601String();
    List<String> imagesIdList = [];
    if (imagesList.isNotEmpty) {
      imagesIdList = await uploadChatImages(chatId, imagesList, senderId, now);
    }
    final message = Message(
      id: now,
      receiverId: receiverId,
      senderId: senderId,
      message: content,
      sentAt: now,
      imagesIdList: imagesIdList,
      replyMessage: replyMessage?.toJson(),
    );
    final res = _chatRepository.sendMessage(
      chatId: chatId,
      message: message,
    );
    res.fold((l) => debugPrint(l.messsage), (r) {
      if (receiverToken == null) return;
      _pushNotificationNotifier.sendPushNoti(
          senderName: senderName,
          receiverToken: receiverToken,
          bodyMessage: content);
    });
    return res;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllMessages(
      String currentUid, String chatUserId) {
    try {
      final chatId = getUniqueIdFrom2String(currentUid, chatUserId);
      return _chatRepository.getAllMessages(chatId);
    } catch (e) {
      debugPrint('chat_error get all message: $e');
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getLastMessage(
      String currentUid, String chatUserId) {
    try {
      final chatId = getUniqueIdFrom2String(currentUid, chatUserId);
      return _chatRepository.getLastMessage(chatId);
    } catch (e) {
      debugPrint('chat_error get last message: $e');
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllChatUsers() {
    try {
      return _chatRepository.getAllChatUsers();
    } catch (e) {
      debugPrint('chat_error get all chat user: $e');
      return null;
    }
  }

  FutureEither<void> addUserToChatList(String userId, String chatUserId) async {
    return await _chatRepository.addUserToChatList(userId, chatUserId);
  }

  void getAllChat(List<String> listChat) async {
    try {
      state = const ChatListState.loading();
      final listData = await _chatRepository.getAllChat(listChat);
      final chatList =
          listData?.docs.map((e) => User.fromJson(e.data())).toList() ?? [];
      if (chatList.isEmpty) {
        state = const ChatListState.empty();
      } else {
        List<User> orderedChatList = [];

        for (String value in listChat) {
          for (User user in chatList) {
            if (user.uid == value) {
              orderedChatList.add(user);
              break;
            }
          }
        }
        state = ChatListState.data(chatList: orderedChatList);
      }
    } on FirebaseException catch (e) {
      debugPrint(
          'chat_error get all chat 1: ${e.message ?? 'Some unexpected error occured'}');
      state = const ChatListState.error();
      return null;
    } catch (e) {
      debugPrint('chat_error get all chat 2: ${e.toString()}');
      state = const ChatListState.error();
      return null;
    }
  }

  FutureVoid updateMessage({
    required String chatId,
    required String messageId,
  }) async {
    await _chatRepository.setSeenMessage(chatId: chatId, messageId: messageId);
  }

  Future<List<String>> uploadChatImages(
      String chatId, List<File> images, String uid, String sentAt) async {
    List<String> imageUrls = [];
    List<UploadTask> tasks = [];

    const uuid = Uuid();
    for (final image in images) {
      try {
        final uniqueId = uuid.v4();
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('images/chat/$chatId/$uniqueId');
        final uploadTask = storageRef.putFile(image);
        tasks.add(uploadTask);
      } catch (e) {
        debugPrint("Error uploading image ${image.path}: $e");
      }
    }

    try {
      await Future.wait(tasks); // Wait for all uploads to finish
      for (var task in tasks) {
        final snapshot = await task;
        imageUrls.add(await snapshot.ref.getDownloadURL());
      }
      //xu ly truong hop list hinh moi ko de len list hinh cu
      // final originalImagesList =
      //     await _chatImagesNotifier.getChatImages(chatId);
      // if (originalImagesList != null) {
      //   final updateImagesList = originalImagesList;
      //   updateImagesList.addAll(imageUrls);
      //   _chatRepository.uploadChatImages(
      //       chatId: chatId, imagesList: updateImagesList);
      // }

      for (final urlImage in imageUrls) {
        final id = const Uuid().v4();
        final attachment =
            Attachment(id: id, url: urlImage, uid: uid, sentAt: sentAt);
        _chatRepository.uploadChatImages(
            chatId: chatId, attachment: attachment);
      }
    } catch (e) {
      debugPrint("Error uploading images: $e");
    }

    return imageUrls;
  }
}
