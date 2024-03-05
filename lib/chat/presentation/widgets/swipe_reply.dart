import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';

/// Ref: https://docs.flutter.dev/cookbook/animation/physics-simulation
class SwipeReply extends StatefulWidget {
  const SwipeReply({
    super.key,
    required this.child,
    required this.initAlign,
    required this.reply,
  });

  final Widget child;
  final Alignment initAlign;
  final VoidCallback? reply;

  @override
  State<SwipeReply> createState() => _SwipeReplyState();
}

class _SwipeReplyState extends State<SwipeReply>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  late double _dragSpacing = 0;

  late Animation<double> _animation;

  bool isReply = false;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation() {
    _animation = _controller.drive(
      Tween<double>(
        begin: _dragSpacing,
        end: 0,
      ),
    );

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -0.5);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragSpacing = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // current maxWithRemain get min remaining space to swipe of left and right message
    // to let 2 swipe space (left & right) equal
    // default is screenWidth * 110 / 375 ==> left & right will be calculate again below
    final maxWidthRemain = context.screenWidth * 110 / 375 - 55;

    return widget.reply == null
        ? widget.child
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragDown: (details) {
              _controller.stop();
            },
            onHorizontalDragUpdate: (details) {
              double deltaX = details.delta.dx;
              if (isReply &&
                  ((widget.initAlign.x < 0 && deltaX > 0) || //from left
                      (widget.initAlign.x > 0 && deltaX < 0))) {
                //from right
                deltaX /=
                    10; //divide 7 to swipe smaller space after reply active
              } else {
                deltaX /= 2; // divide 2 to swipe half-space
              }
              _handleSwipe(deltaX: deltaX, maxWidthRemain: maxWidthRemain);
              // _handleSwipeWithDiffrentSpace(deltaX: deltaX, maxWidthRemain: maxWidthRemain);
            },
            onHorizontalDragEnd: (details) {
              if (isReply) {
                widget.reply?.call();
                isReply = false;
              }
              _runAnimation();
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  transform: Matrix4.translationValues(
                      -widget.initAlign.x * _dragSpacing, 0, 0),
                  child: widget.child,
                ),
                Positioned(
                  right: widget.initAlign == Alignment.centerRight ? -20 : null,
                  left: widget.initAlign == Alignment.centerRight ? null : -20,
                  child: Container(
                    transform: Matrix4.translationValues(
                        -widget.initAlign.x * _dragSpacing / 2, 0, 0),
                    alignment: widget.initAlign,
                    child: Icon(
                      Icons.reply,
                      size: 20,
                      color: widget.initAlign == Alignment.centerRight
                          ? Colors.blue
                          : Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
  }

  _handleSwipe({
    required double deltaX,
    required double maxWidthRemain,
  }) {
    var dragSpacing = _dragSpacing;
    dragSpacing += -widget.initAlign.x * deltaX;

    if (dragSpacing >= maxWidthRemain * 0.75 && !isReply) {
      isReply = true;
      HapticFeedback.lightImpact();
    } else if (dragSpacing < maxWidthRemain * 0.6 && isReply) {
      isReply = false;
    }
    if (dragSpacing < maxWidthRemain && deltaX != 0) {
      setState(() {
        _dragSpacing = dragSpacing < 0 ? 0 : dragSpacing;
      });
    }
  }
}
