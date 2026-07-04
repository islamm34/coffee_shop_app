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
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _categories = [
    {'name': 'All', 'icon': 'https://api.iconify.design/lucide/coffee.svg'},
    {'name': 'Espresso', 'icon': 'https://api.iconify.design/lucide/coffee.svg'},
    {'name': 'Cold Brew', 'icon': 'https://api.iconify.design/lucide/snowflake.svg'},
    {'name': 'Latte', 'icon': 'https://api.iconify.design/lucide/milk.svg'},
    {'name': 'Cappuccino', 'icon': 'https://api.iconify.design/lucide/coffee.svg'},
    {'name': 'Desserts', 'icon': 'https://api.iconify.design/lucide/cake.svg'},
  ];

  final List<Map<String, dynamic>> _allCoffeeProducts = [
    {'name': 'Caramel Macchiato', 'price': '\$5.50', 'rating': 4.8, 'image': ImageConstants.coffee1, 'category': 'Latte'},
    {'name': 'Iced Americano', 'price': '\$4.50', 'rating': 4.6, 'image': ImageConstants.coffee2, 'category': 'Cold Brew'},
    {'name': 'Mocha Frappe', 'price': '\$6.00', 'rating': 4.9, 'image': ImageConstants.coffee3, 'category': 'Cold Brew'},
    {'name': 'Vanilla Latte', 'price': '\$5.00', 'rating': 4.7, 'image': ImageConstants.coffee4, 'category': 'Latte'},
    {'name': 'Espresso Shot', 'price': '\$3.50', 'rating': 4.5, 'image': ImageConstants.coffee5, 'category': 'Espresso'},
    {'name': 'Cappuccino', 'price': '\$5.50', 'rating': 4.8, 'image': ImageConstants.coffee6, 'category': 'Cappuccino'},
    {'name': 'Hazelnut Latte', 'price': '\$5.75', 'rating': 4.7, 'image': ImageConstants.coffee7, 'category': 'Latte'},
    {'name': 'Cold Brew Black', 'price': '\$4.00', 'rating': 4.4, 'image': ImageConstants.coffee8, 'category': 'Cold Brew'},
    {'name': 'Espresso Macchiato', 'price': '\$4.25', 'rating': 4.6, 'image': ImageConstants.coffee1, 'category': 'Espresso'},
    {'name': 'Caramel Frappe', 'price': '\$6.50', 'rating': 4.9, 'image': ImageConstants.coffee2, 'category': 'Cold Brew'},
    {'name': 'Pumpkin Spice Latte', 'price': '\$5.95', 'rating': 4.8, 'image': ImageConstants.coffee3, 'category': 'Latte'},
    {'name': 'Flat White', 'price': '\$4.75', 'rating': 4.5, 'image': ImageConstants.coffee4, 'category': 'Cappuccino'},
  ];

  final List<Map<String, dynamic>> _allDessertProducts = [
    {'name': 'Chocolate Croissant', 'price': '\$4.50', 'rating': 4.9, 'image': ImageConstants.dessert1, 'category': 'Desserts'},
    {'name': 'Cheesecake', 'price': '\$6.00', 'rating': 4.8, 'image': ImageConstants.dessert2, 'category': 'Desserts'},
    {'name': 'Chocolate Chip Cookie', 'price': '\$3.50', 'rating': 4.7, 'image': ImageConstants.dessert3, 'category': 'Desserts'},
    {'name': 'Tiramisu', 'price': '\$6.50', 'rating': 4.9, 'image': ImageConstants.dessert4, 'category': 'Desserts'},
    {'name': 'Blueberry Muffin', 'price': '\$4.00', 'rating': 4.6, 'image': ImageConstants.dessert5, 'category': 'Desserts'},
    {'name': 'Cinnamon Roll', 'price': '\$5.00', 'rating': 4.8, 'image': ImageConstants.dessert6, 'category': 'Desserts'},
    {'name': 'Almond Croissant', 'price': '\$4.75', 'rating': 4.7, 'image': ImageConstants.dessert1, 'category': 'Desserts'},
    {'name': 'Red Velvet Cake', 'price': '\$7.00', 'rating': 4.9, 'image': ImageConstants.dessert2, 'category': 'Desserts'},
    {'name': 'Double Chocolate Cookie', 'price': '\$3.75', 'rating': 4.8, 'image': ImageConstants.dessert3, 'category': 'Desserts'},
  ];

  final List<Map<String, String>> _recommendations = [
    {'name': 'Croissant', 'image': ImageConstants.small1},
    {'name': 'Cookie', 'image': ImageConstants.small2},
    {'name': 'Cheesecake', 'image': ImageConstants.small3},
    {'name': 'Muffin', 'image': ImageConstants.small4},
    {'name': 'Tiramisu', 'image': ImageConstants.small5},
    {'name': 'Cinnamon Roll', 'image': ImageConstants.small1},
    {'name': 'Brownie', 'image': ImageConstants.small2},
  ];

  // عروض محسنة مع أيقونات وألوان جذابة و Routes
  final List<Map<String, dynamic>> _promoBanners = [
    {
      'image': ImageConstants.banner1,
      'title': 'Buy 1 Get 1 Free',
      'subtitle': 'On all cold brew drinks',
      'buttonText': 'Order Now',
      'discount': '50% OFF',
      'tag': '⭐ BEST DEAL',
      'icon': 'https://api.iconify.design/lucide/gift.svg',
      'color': const Color(0xFF4E342E),
      'route': AppRoutes.productDetails,
    },
    {
      'image': ImageConstants.banner2,
      'title': '20% Off',
      'subtitle': 'On your first order',
      'buttonText': 'Claim Offer',
      'discount': '20% OFF',
      'tag': '🔥 NEW USER',
      'icon': 'https://api.iconify.design/lucide/percent.svg',
      'color': const Color(0xFFC89B6D),
      'route': AppRoutes.offers,
    },
    {
      'image': ImageConstants.banner3,
      'title': 'Free Delivery',
      'subtitle': 'On orders above \$15',
      'buttonText': 'Learn More',
      'discount': 'FREE',
      'tag': '🚚 DELIVERY',
      'icon': 'https://api.iconify.design/lucide/truck.svg',
      'color': const Color(0xFF2D2A26),
      'route': AppRoutes.checkout,
    },
    {
      'image': ImageConstants.banner1,
      'title': 'Weekend Special',
      'subtitle': 'Extra shot free with any drink',
      'buttonText': 'Explore',
      'discount': 'FREE SHOT',
      'tag': '🎉 WEEKEND',
      'icon': 'https://api.iconify.design/lucide/calendar.svg',
      'color': const Color(0xFFE65100),
      'route': AppRoutes.productDetails,
    },
    {
      'image': ImageConstants.banner2,
      'title': 'Loyalty Bonus',
      'subtitle': 'Buy 5 drinks get 1 free',
      'buttonText': 'Join Now',
      'discount': 'BUY 5 GET 1',
      'tag': '💎 LOYALTY',
      'icon': 'https://api.iconify.design/lucide/award.svg',
      'color': const Color(0xFF2E7D32),
      'route': AppRoutes.offers,
    },
  ];

  List<Map<String, dynamic>> get _filteredCoffeeProducts {
    if (_selectedCategory == 'All') {
      return _allCoffeeProducts;
    }
    return _allCoffeeProducts
        .where((product) => product['category'] == _selectedCategory)
        .toList();
  }

  List<Map<String, dynamic>> get _filteredDessertProducts {
    if (_selectedCategory == 'All' || _selectedCategory == 'Desserts') {
      return _allDessertProducts;
    }
    return [];
  }

  List<Map<String, String>> get _filteredRecommendations {
    if (_selectedCategory == 'All' || _selectedCategory == 'Desserts') {
      return _recommendations;
    }
    return _recommendations.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F5F2),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // App Bar
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Row(
                      children: [
                        SvgPicture.network(
                          'https://api.iconify.design/lucide/map-pin.svg',
                          width: 18,
                          height: 18,
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
                                  width: 14,
                                  height: 14,
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
                                width: 22,
                                height: 22,
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
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
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
                          controller: _searchController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Search for coffee...',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFBDBDBD),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.network(
                                'https://api.iconify.design/lucide/search.svg',
                                width: 18,
                                height: 18,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFC89B6D),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Promo Banners
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '🔥 Special Offers',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2D2A26),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go(AppRoutes.offers);
                                },
                                child: Text(
                                  'See All',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFC89B6D),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
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
                                  discount: banner['discount'],
                                  tag: banner['tag'],
                                  icon: banner['icon'],
                                  color: banner['color'],
                                  route: banner['route'],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Categories
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
                                    fontSize: 13,
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
                                final category = _categories[index];
                                final isSelected = category['name'] == _selectedCategory;
                                return CategoryCard(
                                  name: category['name']!,
                                  icon: category['icon']!,
                                  isSelected: isSelected,
                                  onTap: () {
                                    setState(() {
                                      _selectedCategory = category['name']!;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Best Sellers
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
                          if (_filteredCoffeeProducts.isNotEmpty)
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _filteredCoffeeProducts.length,
                                itemBuilder: (context, index) {
                                  final product = _filteredCoffeeProducts[index];
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
                            )
                          else
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'No coffee products in this category',
                                  style: TextStyle(
                                    color: Color(0xFF7D6E63),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Desserts
                  if (_selectedCategory == 'All' || _selectedCategory == 'Desserts')
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
                                  onPressed: () {
                                    context.go(AppRoutes.categories);
                                  },
                                  child: Text(
                                    'See All',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFC89B6D),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (_filteredDessertProducts.isNotEmpty)
                              SizedBox(
                                height: 260,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _filteredDessertProducts.length,
                                  itemBuilder: (context, index) {
                                    final product = _filteredDessertProducts[index];
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
                  // Recommended
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
                              itemCount: _filteredRecommendations.length,
                              itemBuilder: (context, index) {
                                final item = _filteredRecommendations[index];
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
                    child: SizedBox(height: 20),
                  ),
                ],
              ),
            ),
            // Navigation Bar
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigation(
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
          ],
        ),
      ),
    );
  }
}