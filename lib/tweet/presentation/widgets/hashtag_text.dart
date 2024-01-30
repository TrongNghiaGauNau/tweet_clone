import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/presentation/views/hashtag_view.dart';

class HashtagOrLinkText extends StatelessWidget {
  const HashtagOrLinkText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = [];

    text.split(' ').forEach(
      (element) {
        if (element.startsWith('#')) {
          textSpans.add(TextSpan(
              text: ' $element',
              style: const TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HashTagView(hashtag: element),
                    ))));
        } else if (element.startsWith('www.') ||
            element.startsWith('https://')) {
          textSpans.add(TextSpan(
              text: ' $element',
              style: const TextStyle(color: Pallete.blueColor, fontSize: 18)));
        } else {
          textSpans.add(TextSpan(
              text: '$element ', style: const TextStyle(fontSize: 18)));
        }
      },
    );
    return RichText(text: TextSpan(children: textSpans));
  }
}
