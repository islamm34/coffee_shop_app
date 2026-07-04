// lib/presentation/widgets/cards/recommendation_card.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RecommendationCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const RecommendationCard({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: EdgeInsets.only(right: AppSpacing.md),
        decoration: BoxDecoration(
          color: context.cardBackground,
          borderRadius: AppRadius.xxlRadius,
          boxShadow: AppShadows.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: Image.network(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: context.backgroundColor,
                    child: Icon(
                      Icons.image_not_supported,
                      color: context.textSecondary,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text(
                name,
                style: AppTextStyles.titleSmall.copyWith(
                  color: context.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
