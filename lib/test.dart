import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test scren')),
      body: Column(
        children: [
          loadingNotiTile(),
          const SizedBox(height: 10),
          loadingNotiTile(),
          const SizedBox(height: 10),
          loadingNotiTile(),
          const SizedBox(height: 10),
          loadingNotiTile(),
          const SizedBox(height: 10),
          loadingNotiTile(),
        ],
      ),
    );
  }

  Row loadingNotiTile() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const SizedBox(
              width: double.infinity,
              height: 100,
              child: CircleAvatar(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(),
            ),
          ),
        )
      ],
    );
  }
}
