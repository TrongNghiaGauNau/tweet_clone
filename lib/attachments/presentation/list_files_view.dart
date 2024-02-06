import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';

class ListFilesView extends HookConsumerWidget {
  const ListFilesView(
      {super.key, required this.initialIndex, required this.tweet});

  final int initialIndex;
  final Tweet tweet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createdDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(tweet.tweetedAt));
    final imageList = tweet.imagesLink;
    final pageController = usePageController(initialPage: initialIndex);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(tweet.tweetCreator[TweetCreator.creatorName] ?? 'username',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
