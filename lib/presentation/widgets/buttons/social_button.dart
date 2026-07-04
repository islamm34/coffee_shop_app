import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_radius.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final double size;
  final double? width;
  final double? height;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 24,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? AppDimensions.buttonHeightLg,
        height: height ?? AppDimensions.buttonHeightLg,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightSurface,
          borderRadius: AppRadius.lgRadius,
          border: Border.all(
            color: isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
            width: 1,
          ),
        ),
        child: Center(
          child: SvgPicture.network(
            icon,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}