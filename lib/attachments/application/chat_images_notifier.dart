import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/infratruscture/model/attachment/attachment.dart';
import 'package:twitter_clone_2/chat/infrastructure/chat_repository.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/chat_image_list/chat_images_state.dart';

class ChatImagesNotifier extends StateNotifier<ChatImagesState> {
  ChatImagesNotifier({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const ChatImagesState.init());

  final ChatRepository _chatRepository;

  Future<List<Attachment>?> getChatImages(String chatId) async {
    state = const ChatImagesState.loading();
    try {
      final imageList = await _chatRepository.getChatImages(chatId);
      if (imageList != null) {
        if (imageList.isEmpty) {
          state = const ChatImagesState.empty();
          return [];
        } else {
          state = ChatImagesState.data(imagesList: imageList);
          return imageList;
        }
      } else {
        state = const ChatImagesState.error();
        return null;
      }
    } catch (error) {
      state = const ChatImagesState.error();
      debugPrint('ChatImageNotifier Error - getChatImages: $error');
      return null;
    }
  }
}
