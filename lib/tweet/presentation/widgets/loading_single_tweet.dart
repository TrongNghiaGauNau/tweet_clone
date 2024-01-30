import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

class LoadingSingleTweet extends HookConsumerWidget {
  const LoadingSingleTweet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = useMemoized(() => context.screenWidth);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const SizedBox(
                  child: CircleAvatar(),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SizedBox(
                width: width * 0.8,
                height: 200,
                child: const Card(),
              ),
            )
          ],
        ),
        const Divider(
          color: Pallete.greyColor,
        ),
      ],
    );
  }
}
