import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HashTagView extends ConsumerWidget {
  const HashTagView({super.key, required this.hashtag});

  final String hashtag;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hashtag),
      ),
      body: Center(
        child: Text('Hashtag View'),
      ),
    );
  }
}
