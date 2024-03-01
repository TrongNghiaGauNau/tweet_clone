import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_2/attachments/presentation/list_files_view.dart';
import 'package:twitter_clone_2/tweet/application/tweet_const.dart';
import 'package:twitter_clone_2/tweet/infrastructure/models/tweet/tweet_model.dart';

class CarouselImage extends HookWidget {
  const CarouselImage({super.key, required this.tweet});

  final Tweet tweet;
  @override
  Widget build(BuildContext context) {
    final imageLinks = tweet.imagesLink;
    final current = useState(0);
    return Column(
      children: [
        const SizedBox(height: 5),
        CarouselSlider(
            items: imageLinks.mapWithIndex(
              (link, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListFilesView(
                        initialIndex: index,
                        imagesList: tweet.imagesLink,
                        createAt: tweet.tweetedAt,
                        creatorName:
                            tweet.tweetCreator[TweetCreator.creatorName] ??
                                'username',
                      ),
                    )),
                    child: SingleImageCarousel(link: link),
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                current.value = index;
              },
            )),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageLinks.asMap().entries.map((e) {
            return Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                      .withOpacity(current.value == e.key ? 0.9 : 0.4)),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SingleImageCarousel extends HookWidget {
  const SingleImageCarousel({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Image.network(
      link,
      fit: BoxFit.cover,
    );
  }
}
