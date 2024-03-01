import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';

class SineCurve extends Curve {
  const SineCurve({this.count = 2});

  final double count;

  // 2. override transformInternal() method
  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}

class AnimatedFocusWrapper extends HookConsumerWidget {
  const AnimatedFocusWrapper({
    required this.child,
    required this.messageId,
    super.key,
  });
  final String messageId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final Animation<double> shakeAnimation =
        Tween(begin: 0.0, end: 0.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const SineCurve(),
      ),
    );

    final isFocusMessage = ref.watch(
      focusMessageIdProvider.select((value) {
        return value == messageId;
      }),
    );

    final focusNotifier = ref.read(focusMessageIdProvider.notifier);
    useEffect(() {
      onAnimationCompleted() {
        if (animationController.status == AnimationStatus.completed) {
          if (focusNotifier.state == messageId) {
            focusNotifier.state = null;
          }
          animationController.reset();
        }
      }

      animationController.addListener(onAnimationCompleted);
      return () {
        animationController.removeListener(onAnimationCompleted);
      };
    }, [animationController, focusNotifier, messageId]);

    useEffect(() {
      if (isFocusMessage) {
        animationController.forward();
      }
      return null;
    }, [animationController, isFocusMessage]);
    return AnimatedBuilder(
        animation: shakeAnimation,
        child: child,
        builder: (context, child) {
          return HookBuilder(builder: (context) {
            return Transform.translate(
              offset: Offset(useAnimation(shakeAnimation) * 10, 0),
              child: child,
            );
          });
        });
  }
}
