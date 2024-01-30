import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/auth/infrastructure/models/auth_state.dart';
import 'package:twitter_clone_2/auth/presentation/login/login_screen.dart';
import 'package:twitter_clone_2/auth/presentation/widget/auth_field.dart';
import 'package:twitter_clone_2/auth/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/common/rounded_small_button.dart';
import 'package:twitter_clone_2/core/presentation/constants/ui_constants.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

class SignUpView extends HookConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBar = UIConstants.appBar();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authState = ref.watch(authControllerProvider);

    void onSignUp() async {
      ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              AuthField(controller: emailController, hintText: 'email'),
              const SizedBox(height: 25),
              AuthField(controller: passwordController, hintText: 'password'),
              const SizedBox(height: 40),
              Align(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(
                    onTap: authState == const AuthState.loading()
                        ? () {}
                        : onSignUp,
                    label: 'Done',
                    backgroundColor: Pallete.whiteColor,
                    textColor: Pallete.backgroundColor,
                  )),
              const SizedBox(height: 40),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(fontSize: 16),
                      children: [
                    TextSpan(
                        text: ' Sign in',
                        style: const TextStyle(
                            color: Pallete.blueColor, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                          }),
                  ])),
              const SizedBox(height: 10),
              if (authState == const AuthState.loading())
                const CircularProgressIndicator()
            ]),
          ),
        ),
      ),
    );
  }
}
