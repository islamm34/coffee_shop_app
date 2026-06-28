// lib/presentation/widgets/animations/scale_animation.dart
import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final Animation<double>? animation;

  const ScaleAnimation({
    super.key,
    required this.child,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    if (animation != null) {
      return ScaleTransition(
        scale: animation!,
        child: child,
      );
    }
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}