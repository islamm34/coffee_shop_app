import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_dimensions.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final double rating;
  final String image;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorited;
  final String? badge;
  final double? width;
  final double? height;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.onTap,
    required this.onFavoriteTap,
    this.isFavorited = false,
    this.badge,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppDimensions.productCardWidth,
        margin: const EdgeInsets.only(right: AppSpacing.lg),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: AppRadius.xxlRadius,
          boxShadow: AppShadows.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.network(
                    image,
                    height: height ?? 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: height ?? 150,
                        width: double.infinity,
                        color: isDarkMode
                            ? AppColors.darkSurface
                            : AppColors.lightSurface,
                        child: Icon(
                          Icons.coffee,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: AppSpacing.md,
                  right: AppSpacing.md,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.darkCard
                            : AppColors.lightCard,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.network(
                        isFavorited
                            ? 'https://api.iconify.design/lucide/heart.svg?color=red'
                            : 'https://api.iconify.design/lucide/heart.svg',
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                          isFavorited ? AppColors.error : AppColors.lightTextHint,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  bottom: AppSpacing.md,
                  left: AppSpacing.md,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: AppRadius.mdRadius,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.network(
                          'https://api.iconify.design/lucide/star.svg',
                          width: 12,
                          height: 12,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFD700),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          rating.toStringAsFixed(1),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Optional Badge
                if (badge != null)
                  Positioned(
                    top: AppSpacing.md,
                    left: AppSpacing.md,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: AppRadius.mdRadius,
                      ),
                      child: Text(
                        badge!,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: isDarkMode
                              ? AppColors.darkTextPrimary
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Content Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: isDarkMode
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      price,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}