import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone_2/core/application/utils.dart';

class AttachmentNotifier extends StateNotifier<List<File>> {
  AttachmentNotifier() : super(const []);

  Future<bool> pickChatImages() async {
    final listImages = await pickImages();

    final currentList = state;

    if (currentList.isNotEmpty) {
      if (currentList.length + listImages.length > 5) {
        return false;
      }
      state = [...currentList..addAll(listImages)];
    } else {
      if (listImages.length > 5) return false;
      state = listImages;
    }

    return true;
  }

  Future<bool> takeChatCameraImage() async {
    final image = await pickImage(imageSource: ImageSource.camera);
    if (image == null) return false;

    final currentList = state;

    if (currentList.isNotEmpty) {
      if (currentList.length + 1 > 5) {
        return false;
      }
      state = [...currentList..add(image)];
    } else {
      state = [image];
    }
    return true;
  }

  void remove(int index) {
    state = [...state..removeAt(index)];
  }

  void clear() {
    state = [];
  }
}
