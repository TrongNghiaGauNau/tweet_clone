import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:twitter_clone_2/chat/presentation/widgets/dialog_button.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';

const tweetId = '52ace26e-d0b9-495b-9d31-aae5db9e263d';

class TestScreen extends HookConsumerWidget with DismissKeyboard {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
