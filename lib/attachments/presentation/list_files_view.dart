import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ListFilesView extends HookConsumerWidget {
  const ListFilesView(
      {super.key,
      required this.initialIndex,
      required this.imagesList,
      required this.createAt,
      this.creatorName});

  final int initialIndex;
  final List<String> imagesList;
  final String createAt;
  final String? creatorName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createdDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(createAt));
    final imageList = imagesList;
    final pageController = usePageController(initialPage: initialIndex);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            if (creatorName != null)
              Text(creatorName!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            Text(createdDate, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageList.length,
        wantKeepAlive: true,
        pageController: pageController,
        loadingBuilder: (context, event) =>
            const Center(child: CircularProgressIndicator()),
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageList[index]),
            filterQuality: FilterQuality.high,
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 4,
          );
        },
      ),
    );
  }
}
