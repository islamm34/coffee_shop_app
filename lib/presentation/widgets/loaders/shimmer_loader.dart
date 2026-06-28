// lib/presentation/widgets/loaders/shimmer_loader.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder? shape;

  const ShimmerLoader({
    super.key,
    this.width,
    this.height,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8E0DA),
      highlightColor: const Color(0xFFF8F5F2),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 100,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}