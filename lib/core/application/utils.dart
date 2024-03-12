import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: const Duration(seconds: 2),
  ));
}

String getNameFromEmail(String email) {
  return email.split('@')[0];
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  final picker = ImagePicker();
  final imageFiles = await picker.pickMultiImage();
  if (imageFiles.isNotEmpty) {
    for (final image in imageFiles) {
      images.add(File(image.path));
    }
  }
  return images;
}

Future<File?> pickImage({ImageSource imageSource = ImageSource.gallery}) async {
  final picker = ImagePicker();
  final imageFile = await picker.pickImage(source: imageSource);
  if (imageFile != null) {
    return File(imageFile.path);
  }
  return null;
}

String getLinkFromText(String text) {
  List<String> wordsInSentence = text.split(' ');
  String link = '';
  for (String word in wordsInSentence) {
    if (word.startsWith('https://') || word.startsWith('www.')) {
      link = word;
    }
  }
  return link;
}

List<String> getHashtagsFromText(String text) {
  List<String> wordsInSentence = text.split(' ');
  List<String> hashTags = [];
  for (String word in wordsInSentence) {
    if (word.startsWith('#')) {
      hashTags.add(word);
    }
  }
  return hashTags;
}

String getUniqueIdFrom2String(String user1Id, String user2Id) {
  // Sort the user IDs alphabetically to ensure consistency
  List<String> sortedUserIds = [user1Id, user2Id]..sort();

  // Concatenate the sorted user IDs to create a unique chat ID
  String chatId = sortedUserIds.join('_');

  return chatId;
}
