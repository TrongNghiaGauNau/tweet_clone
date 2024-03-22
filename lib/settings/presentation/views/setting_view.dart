import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/test.dart';
import 'package:twitter_clone_2/upgrade/presentation/upgrade_view.dart';
import 'package:twitter_clone_2/user_profile/presentation/views/profile_screen.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUID = ref.watch(firebaseAuthProvider).currentUser?.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            settingTile(
              icon: const Icon(Icons.person),
              text: 'Profile',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(uid: currentUID ?? ''),
              )),
            ),
            const SizedBox(height: 10),
            settingTile(icon: const Icon(Icons.lock), text: 'Change Password'),
            const SizedBox(height: 10),
            settingTile(
              icon: const Icon(Icons.logout),
              text: 'Log Out',
              onTap: () =>
                  ref.read(authControllerProvider.notifier).logout(context),
            ),
            const SizedBox(height: 10),
            settingTile(
              icon: const Icon(Icons.star, color: Colors.yellow),
              text: 'Upgrade you account',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UpgradeAccountView())),
            ),
            const SizedBox(height: 10),
            settingTile(
              icon: const Icon(Icons.error),
              text: 'Maintainace',
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TestScreen())),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector settingTile(
      {required Icon icon, required String text, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: icon,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(text),
            )),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
