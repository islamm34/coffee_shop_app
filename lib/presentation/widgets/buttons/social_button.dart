// lib/presentation/widgets/buttons/social_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F5F2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE8E0DA),
            width: 1,
          ),
        ),
        child: Center(
          child: SvgPicture.network(
            icon,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}