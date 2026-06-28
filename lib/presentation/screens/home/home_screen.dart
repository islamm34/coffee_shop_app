// lib/presentation/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../constants/image_constants.dart';
import '../../widgets/cards/product_card.dart';
import '../../widgets/cards/category_card.dart';
import '../../widgets/cards/promo_banner.dart';
import '../../widgets/cards/recommendation_card.dart';
import '../../widgets/buttons/floating_cart_button.dart';
import '../../widgets/navigation/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _categories = [
    {'name': 'All', 'icon': 'https://api.iconify.design/lucide/coffee.svg'},
    {'name': 'Espresso', 'icon': 'https://api.iconify.design/lucide/coffee.svg'},
    {'name': 'Cold Brew', 'icon': 'https://api.iconify.design/lucide/snowflake.svg'},
    {'name': 'Latte', 'icon': 'https://api.iconify.design/lucide/milk.svg'},
    {'name': 'Desserts', 'icon': 'https://api.iconify.design/lucide/cake.svg'},
  ];

  final List<Map<String, dynamic>> _coffeeProducts = [
    {'name': 'Caramel Macchiato', 'price': '\$5.50', 'rating': 4.8, 'image': ImageConstants.coffee1},
    {'name': 'Iced Americano', 'price': '\$4.50', 'rating': 4.6, 'image': ImageConstants.coffee2},
    {'name': 'Mocha Frappe', 'price': '\$6.00', 'rating': 4.9, 'image': ImageConstants.coffee3},
    {'name': 'Vanilla Latte', 'price': '\$5.00', 'rating': 4.7, 'image': ImageConstants.coffee4},
    {'name': 'Espresso Shot', 'price': '\$3.50', 'rating': 4.5, 'image': ImageConstants.coffee5},
    {'name': 'Cappuccino', 'price': '\$5.50', 'rating': 4.8, 'image': ImageConstants.coffee6},
  ];

  final List<Map<String, dynamic>> _dessertProducts = [
    {'name': 'Chocolate Croissant', 'price': '\$4.50', 'rating': 4.9, 'image': ImageConstants.dessert1},
    {'name': 'Cheesecake', 'price': '\$6.00', 'rating': 4.8, 'image': ImageConstants.dessert2},
    {'name': 'Chocolate Chip Cookie', 'price': '\$3.50', 'rating': 4.7, 'image': ImageConstants.dessert3},
    {'name': 'Tiramisu', 'price': '\$6.50', 'rating': 4.9, 'image': ImageConstants.dessert4},
    {'name': 'Blueberry Muffin', 'price': '\$4.00', 'rating': 4.6, 'image': ImageConstants.dessert5},
    {'name': 'Cinnamon Roll', 'price': '\$5.00', 'rating': 4.8, 'image': ImageConstants.dessert6},
  ];

  final List<Map<String, String>> _recommendations = [
    {'name': 'Croissant', 'image': ImageConstants.small1},
    {'name': 'Cookie', 'image': ImageConstants.small2},
    {'name': 'Cheesecake', 'image': ImageConstants.small3},
    {'name': 'Muffin', 'image': ImageConstants.small4},
    {'name': 'Tiramisu', 'image': ImageConstants.small5},
  ];

  final List<Map<String, String>> _promoBanners = [
    {'image': ImageConstants.banner1, 'title': 'Buy 1 Get 1 Free', 'subtitle': 'On all cold brew drinks', 'buttonText': 'Order Now'},
    {'image': ImageConstants.banner2, 'title': '20% Off', 'subtitle': 'On your first order', 'buttonText': 'Claim Offer'},
    {'image': ImageConstants.banner3, 'title': 'Free Delivery', 'subtitle': 'On orders above \$15', 'buttonText': 'Learn More'},
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // منع الخروج من التطبيق من الصفحة الرئيسية
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F5F2),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Row(
                    children: [
                      SvgPicture.network(
                        'https://api.iconify.design/lucide/map-pin.svg',
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFC89B6D),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery to',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: const Color(0xFF7D6E63),
                              letterSpacing: 0.5,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Coffee Street 123',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2D2A26),
                                ),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.network(
                                'https://api.iconify.design/lucide/chevron-down.svg',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          context.go(AppRoutes.notifications);
                        },
                        icon: Stack(
                          children: [
                            SvgPicture.network(
                              'https://api.iconify.design/lucide/bell.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF4E342E),
                                BlendMode.srcIn,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF44336),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
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
                        decoration: InputDecoration(
                          hintText: 'Search for coffee...',
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
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _promoBanners.length,
                      itemBuilder: (context, index) {
                        final banner = _promoBanners[index];
                        return Container(
                          width: MediaQuery.of(context).size.width - 32,
                          margin: const EdgeInsets.only(right: 16),
                          child: PromoBanner(
                            image: banner['image']!,
                            title: banner['title']!,
                            subtitle: banner['subtitle']!,
                            buttonText: banner['buttonText']!,
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2D2A26),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go(AppRoutes.categories);
                              },
                              child: Text(
                                'See All',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFC89B6D),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categories.length,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                name: _categories[index]['name']!,
                                icon: _categories[index]['icon']!,
                                isSelected: index == 0,
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Best Sellers',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D2A26),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 260,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _coffeeProducts.length,
                            itemBuilder: (context, index) {
                              final product = _coffeeProducts[index];
                              return ProductCard(
                                name: product['name'],
                                price: product['price'],
                                rating: product['rating'],
                                image: product['image'],
                                onTap: () {
                                  context.go(AppRoutes.productDetails);
                                },
                                onFavoriteTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '🍰 Desserts',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2D2A26),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFC89B6D),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 260,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _dessertProducts.length,
                            itemBuilder: (context, index) {
                              final product = _dessertProducts[index];
                              return ProductCard(
                                name: product['name'],
                                price: product['price'],
                                rating: product['rating'],
                                image: product['image'],
                                onTap: () {
                                  context.go(AppRoutes.productDetails);
                                },
                                onFavoriteTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended for You',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D2A26),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _recommendations.length,
                            itemBuilder: (context, index) {
                              final item = _recommendations[index];
                              return RecommendationCard(
                                name: item['name']!,
                                image: item['image']!,
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
            const Positioned(
              bottom: 90,
              right: 16,
              child: FloatingCartButton(
                itemCount: 3,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          selectedIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0) {
              // Home
            } else if (index == 1) {
              context.go(AppRoutes.categories);
            } else if (index == 2) {
              context.go(AppRoutes.cart);
            } else if (index == 3) {
              context.go(AppRoutes.profile);
            }
          },
        ),
      ),
    );
  }
}