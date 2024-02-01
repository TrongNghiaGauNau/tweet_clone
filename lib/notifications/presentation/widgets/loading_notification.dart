import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingNotifications extends StatelessWidget {
  const LoadingNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          LoadingNotiTile(),
          SizedBox(height: 10),
          LoadingNotiTile(),
          SizedBox(height: 10),
          LoadingNotiTile(),
          SizedBox(height: 10),
          LoadingNotiTile(),
          SizedBox(height: 10),
          LoadingNotiTile(),
        ],
      ),
    );
  }
}

class LoadingNotiTile extends StatelessWidget {
  const LoadingNotiTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
