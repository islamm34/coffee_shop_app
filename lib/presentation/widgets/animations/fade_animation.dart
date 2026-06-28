// lib/presentation/widgets/animations/fade_animation.dart
import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Widget child;
  final Animation<double>? animation;
  final double delay;

  const FadeAnimation({
    super.key,
    required this.child,
    this.animation,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (animation != null) {
      return FadeTransition(
        opacity: animation!,
        child: child,
      );
    }
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}