import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/attachments/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';

const chatId = 'jxdupRbPtSZ6Y1HczNrgB1Yqe3q1_lftT6BADM8QUGP0b6xx5q4GwtNi1';

class TestScreen extends HookWidget with DismissKeyboard {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    var offset = textController.selection.baseOffset;
    debugPrint('kaka: $offset');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextField(
          minLines: 6,
          maxLines: null,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
    );
  }
}
