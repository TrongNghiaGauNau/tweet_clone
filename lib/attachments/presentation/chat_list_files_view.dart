import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:twitter_clone_2/attachments/infratruscture/model/attachment/attachment.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/extension/string_extension.dart';

class ChatListFilesView extends HookConsumerWidget {
  const ChatListFilesView({
    super.key,
    required this.initialIndex,
    required this.imagesList,
  });

  final int initialIndex;
  final List<Attachment> imagesList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = imagesList;
    final pageController = usePageController(initialPage: initialIndex);
    final imageIndex = useState(initialIndex);
    final chatMember = ref.watch(chatMemeberProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            // if (creatorName != null)

            Text(
                chatMember
                    .lastWhere((userUI) =>
                        userUI.uid == imageList[imageIndex.value].uid)
                    .name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            Text(imageList[imageIndex.value].sentAt.dateToString(),
                style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageList.length,
        wantKeepAlive: true,
        pageController: pageController,
        onPageChanged: (index) => imageIndex.value = index,
        loadingBuilder: (context, event) =>
            const Center(child: CircularProgressIndicator()),
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageList[index].url),
            filterQuality: FilterQuality.high,
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 4,
          );
        },
      ),
    );
  }
}
