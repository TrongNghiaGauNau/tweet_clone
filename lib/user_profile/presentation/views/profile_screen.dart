import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/core/presentation/common/error_page.dart';
import 'package:twitter_clone_2/core/presentation/common/loading_page.dart';
import 'package:twitter_clone_2/user_profile/presentation/widgets/profile_body.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);
    useEffect(() {
      Future(() =>
          ref.read(userControllerProvider.notifier).getUserDetailInfo(uid));
      return null;
    }, [uid]);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: user.when(
          init: () => const Center(
            child: Text('Can not get user information'),
          ),
          data: (userData, tweetsData) {
            return ProfileBody(
              user: userData,
              userTweet: tweetsData,
            );
          },
          error: () => const ErrorText(error: 'Can not get user information'),
          loading: () => const Loader(),
        ),
      ),
    );
  }
}
