import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/application/attachment_notifier.dart';
import 'package:twitter_clone_2/attachments/application/chat_images_notifier.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/chat_image_list/chat_images_state.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';

final uploadingAttachmentProvider =
    StateNotifierProvider.autoDispose<AttachmentNotifier, List<File>>((ref) {
  return AttachmentNotifier();
});

final chatImagesNotiferProvider =
    StateNotifierProvider<ChatImagesNotifier, ChatImagesState>((ref) {
  return ChatImagesNotifier(chatRepository: ref.watch(chatRepository));
});
