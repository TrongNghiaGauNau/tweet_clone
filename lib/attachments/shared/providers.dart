import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/application/attachment_notifier.dart';

final uploadingAttachmentProvider =
    StateNotifierProvider.autoDispose<AttachmentNotifier, List<File>>((ref) {
  return AttachmentNotifier();
});
