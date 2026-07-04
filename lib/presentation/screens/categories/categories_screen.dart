// lib/presentation/screens/categories/categories_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../../core/theme/app_theme.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Espresso', 'image': 'https://picsum.photos/seed/espresso/400/400', 'count': 12},
    {'name': 'Cold Brew', 'image': 'https://picsum.photos/seed/coldbrew/400/400', 'count': 8},
    {'name': 'Latte', 'image': 'https://picsum.photos/seed/latte/400/400', 'count': 10},
    {'name': 'Cappuccino', 'image': 'https://picsum.photos/seed/cappuccino/400/400', 'count': 9},
    {'name': 'Mocha', 'image': 'https://picsum.photos/seed/mocha/400/400', 'count': 6},
    {'name': 'Desserts', 'image': 'https://picsum.photos/seed/desserts/400/400', 'count': 15},
    {'name': 'Croissants', 'image': 'https://picsum.photos/seed/croissants/400/400', 'count': 7},
    {'name': 'Pastries', 'image': 'https://picsum.photos/seed/pastries/400/400', 'count': 11},
    {'name': 'Smoothies', 'image': 'https://picsum.photos/seed/smoothies/400/400', 'count': 5},
    {'name': 'Tea', 'image': 'https://picsum.photos/seed/tea/400/400', 'count': 8},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // استخدام go للعودة للصفحة الرئيسية بدلاً من pop
            context.go(AppRoutes.home);
          },
          icon: SvgPicture.network(
            'https://api.iconify.design/lucide/arrow-left.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              context.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Categories',
          style: AppTextStyles.titleMedium.copyWith(
            color: context.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppSpacing.paddingLg,
        child: Column(
          children: [
            Container(
              padding: AppSpacing.paddingHorizontalLg,
              decoration: BoxDecoration(
                color: context.cardBackground,
                borderRadius: AppRadius.lgRadius,
                boxShadow: AppShadows.cardShadow,
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search categories...',
                  border: InputBorder.none,
                  prefixIcon: SvgPicture.network(
                    'https://api.iconify.design/lucide/search.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      context.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.gapLg,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.lg,
                  mainAxisSpacing: AppSpacing.lg,
                  childAspectRatio: 0.85,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
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
                              category['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  width: double.infinity,
                                  color: context.backgroundColor,
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: context.textSecondary,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: AppSpacing.paddingMd,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category['name'],
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: context.textPrimary,
                                  ),
                                ),
                                Text(
                                  '${category['count']} items',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: context.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}