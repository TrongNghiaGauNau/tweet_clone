import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/auth/presentation/login/login_screen.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/presentation/common/loading_page.dart';
import 'package:twitter_clone_2/core/presentation/main_view.dart';
import 'package:twitter_clone_2/core/shared/providers.dart';
import 'package:twitter_clone_2/env.dart';
import 'package:twitter_clone_2/firebase_options.dart';
import 'package:twitter_clone_2/theme/app_theme.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //stripe
  Stripe.publishableKey = stripePublishKey;
  await Stripe.instance.applySettings();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final currentUser = ref.watch(firebaseAuthProvider).currentUser;

    return MaterialApp(
      title: 'Twitter Clone',
      theme: AppTheme.theme,
      home: authState.when(
        init: () {
          if (currentUser == null) {
            debugPrint('1 authState: $authState');
            return const LoginView();
          }
          debugPrint('2 authState: $authState');
          return const MainView();
        },
        success: () {
          debugPrint('3 authState: $authState');
          return const MainView();
        },
        failure: () {
          debugPrint('4 authState: $authState');
          return const LoginView();
        },
        loading: () {
          debugPrint('5 authState: $authState');
          return const LoadingPage();
        },
      ),
    );
  }
}
