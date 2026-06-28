// lib/presentation/screens/categories/categories_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';

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
      backgroundColor: const Color(0xFFF8F5F2),
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
            colorFilter: const ColorFilter.mode(
              Color(0xFF4E342E),
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2A26),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
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
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF7D6E63),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
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
                                  color: const Color(0xFFF8F5F2),
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Color(0xFF7D6E63),
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category['name'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2D2A26),
                                  ),
                                ),
                                Text(
                                  '${category['count']} items',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF7D6E63),
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