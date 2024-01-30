import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CarouselImage extends HookWidget {
  const CarouselImage({super.key, required this.imageLinks});

  final List<String> imageLinks;
  @override
  Widget build(BuildContext context) {
    final current = useState(0);
    return Column(
      children: [
        CarouselSlider(
            items: imageLinks.map(
              (link) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(
                    link,
                    fit: BoxFit.cover,
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
