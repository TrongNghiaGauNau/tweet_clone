import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/attachments/shared/providers.dart';

class UploadingAttachmentChatItem extends ConsumerWidget {
  const UploadingAttachmentChatItem({
    super.key,
    required this.files,
  });

  final List<File> files;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        itemCount: files.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              children: [
                Positioned.fill(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[200]!,
                              strokeAlign: BorderSide.strokeAlignInside),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.hardEdge,
                        child: Image.file(files[index], fit: BoxFit.cover),
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => ref
                        .read(uploadingAttachmentProvider.notifier)
                        .remove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff83878f),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
