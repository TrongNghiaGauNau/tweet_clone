import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/chat/infrastructure/chat_repository.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/chat_list_state/chat_list_state.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/core/domain/type_defs.dart';
import 'package:twitter_clone_2/notifications/application/push_notification_notifier.dart';
import 'package:twitter_clone_2/tweet/infrastructure/tweet_repository.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

class ChatNotifier extends StateNotifier<ChatListState> {
  ChatNotifier(
      {required ChatRepository chatRepository,
      required PushNotificationNotifier pushNotificationNotifier,
      required TweetRepository tweetRepository})
      : _chatRepository = chatRepository,
        _pushNotificationNotifier = pushNotificationNotifier,
        _tweetRepository = tweetRepository,
        super(const ChatListState.init());

  final ChatRepository _chatRepository;
  final PushNotificationNotifier _pushNotificationNotifier;
  final TweetRepository _tweetRepository;

  FutureEither<void> sendMessage({
    required String message,
    required String receiverId,
    required String senderId,
    required String senderName,
    required String? receiverToken,
    Message? replyMessage,
    List<File> imagesList = const [],
  }) async {
    final now = DateTime.now().toIso8601String();
    List<String> imagesIdList = [];
    if (imagesList.isNotEmpty) {
      imagesIdList = await _tweetRepository.uploadImages(imagesList);
    }
    final myMessage = Message(
      id: '${senderId}_$receiverId',
      receiverId: receiverId,
      senderId: senderId,
      message: message,
      sentAt: now,
      imagesIdList: imagesIdList,
      replyMessage: replyMessage?.toJson(),
    );
    final otherMessage = Message(
      id: '${receiverId}_$senderId',
      receiverId: receiverId,
      senderId: senderId,
      message: message,
      sentAt: now,
      imagesIdList: imagesIdList,
      replyMessage: replyMessage?.toJson(),
    );
    final res = _chatRepository.sendMessage(
        myMessage: myMessage, otherMessage: otherMessage);
    res.fold((l) => debugPrint(l.messsage), (r) {
      if (receiverToken == null) return;
      _pushNotificationNotifier.sendPushNoti(
          senderName: senderName,
          receiverToken: receiverToken,
          bodyMessage: message);
    });
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

  Stream<QuerySnapshot<Map<String, dynamic>>>? getAllChatUsers() {
    try {
      return _chatRepository.getAllChatUsers();
    } catch (e) {
      debugPrint('chat_error: $e');
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
      debugPrint('chat_error: ${e.message ?? 'Some unexpected error occured'}');
      state = const ChatListState.error();
      return null;
    } catch (e) {
      debugPrint('chat_error: ${e.toString()}');
      state = const ChatListState.error();
      return null;
    }
  }

  FutureVoid updateMessage({
    required String myId,
    required String otherId,
    required Message message,
  }) async {
    await _chatRepository.setSeenMessage(
        myId: myId, otherId: otherId, message: message);
  }
}
