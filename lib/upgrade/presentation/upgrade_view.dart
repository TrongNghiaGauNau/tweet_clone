import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter_clone_2/core/presentation/common/common_dialog.dart';
import 'package:twitter_clone_2/core/presentation/common/error_page.dart';
import 'package:twitter_clone_2/upgrade/shared/providers.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class UpgradeAccountView extends HookConsumerWidget {
  const UpgradeAccountView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userUINotifierProvider);

    useEffect(() {
      Future(() =>
          ref.read(userUINotifierProvider.notifier).getCurrentUserUIlInfo());
      return null;
    }, []);

    displayPaymentSheet() async {
      try {
        await stripe.Stripe.instance.presentPaymentSheet().then(
          (value) async {
            final res = await ref
                .read(userControllerProvider.notifier)
                .updateBlueAccount();
            res.fold(
                (l) => showTextDialog(context,
                    content:
                        'Payment success but due to error, account will change to blue account later',
                    icon: const Icon(
                      Icons.error,
                      color: Colors.redAccent,
                      size: 40,
                    )),
                (r) => showTextDialog(context,
                    content: 'You have upgrade your account successfully',
                    icon: const Icon(
                      Icons.celebration,
                      color: Colors.redAccent,
                      size: 40,
                    )));
          },
        );
      } on stripe.StripeException catch (e) {
        debugPrint('Payment failed: ${e.error.localizedMessage}');
        showSnackbar(context, 'Payment Fail');
      } catch (e) {
        debugPrint('An unexpected error occurred: $e');
        showSnackbar(context,
            'Oops.Something went wrong when trying to execute your payment');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade your account'),
      ),
      body: userInfo.when(
        init: () =>
            const Center(child: Text('Upgrade your account to blue twitter')),
        error: () => const ErrorText(error: 'Can not load user data'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (userUI) {
          debugPrint('kakaka: $userUI');
          return SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upgrade your account to blue twitter account to show people that you are special',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 10),
                const Text(
                  'You only need 2 USD to upgrade your account',
                ),
                const SizedBox(height: 20),
                Container(
                  clipBehavior: Clip.hardEdge,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: const Row(
                    children: [
                      Expanded(
                          child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                      Text(
                        'USD',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (userUI.isTwitterBlue)
                  const Center(
                      child: Text(
                    '*You are already upgraded your account',
                    style: TextStyle(fontSize: 18),
                  )),
                if (!userUI.isTwitterBlue)
                  GestureDetector(
                    onTap: () async {
                      final res =
                          await ref.read(upgradeAccountProvider).makePayment();
                      if (res) {
                        displayPaymentSheet();
                      } else {
                        if (context.mounted) {
                          showSnackbar(context, 'Oops something went wrong');
                        }
                      }
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.grey[100]!,
                            child: const SizedBox(
                              width: 100,
                              height: 50,
                              child: Card(),
                            ),
                          ),
                          const Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Purchase',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
