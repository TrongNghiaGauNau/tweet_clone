import 'package:flutter/material.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

class FollowCount extends StatelessWidget {
  const FollowCount({super.key, required this.count, required this.text});

  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$count',
            style: const TextStyle(
                color: Pallete.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(color: Pallete.greyColor, fontSize: 18),
        )
      ],
    );
  }
}
