// lib/presentation/screens/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/secondary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<Map<String, dynamic>> _menuItems = const [
    {'icon': 'wallet', 'title': 'Wallet', 'subtitle': '\$45.00 balance'},
    {'icon': 'gift', 'title': 'Rewards', 'subtitle': '150 points'},
    {'icon': 'heart', 'title': 'Favorites', 'subtitle': '8 items'},
    {'icon': 'map-pin', 'title': 'Addresses', 'subtitle': '2 addresses'},
    {'icon': 'package', 'title': 'Orders', 'subtitle': '12 orders'},
    {'icon': 'settings', 'title': 'Settings', 'subtitle': 'App settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF8F5F2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: const Color(0xFF4E342E),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [

                  Image.network(
                    'https://picsum.photos/seed/profileBanner/800/400',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF4E342E),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Transform.translate(
                offset: const Offset(0, 30),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFC89B6D),
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/seed/profile/70/70',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2D2A26),
                              ),
                            ),
                            Text(
                              'john.doe@email.com',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF7D6E63),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC89B6D).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Premium',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFC89B6D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Column(
                children: _menuItems.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F5F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.network(
                          'https://api.iconify.design/lucide/${item['icon']}.svg',
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF4E342E),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      title: Text(
                        item['title'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      subtitle: Text(
                        item['subtitle'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF7D6E63),
                        ),
                      ),
                      trailing: SvgPicture.network(
                        'https://api.iconify.design/lucide/chevron-right.svg',
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF7D6E63),
                          BlendMode.srcIn,
                        ),
                      ),
                      onTap: () {
                        if (item['title'] == 'Wallet') {
                          context.go(AppRoutes.wallet);
                        } else if (item['title'] == 'Rewards') {
                          context.go(AppRoutes.offers);
                        } else if (item['title'] == 'Settings') {
                          context.go(AppRoutes.settings);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SecondaryButton(
                text: 'Logout',
                onPressed: () {
                  context.go(AppRoutes.welcome);
                },
                fullWidth: true,
                textColor: const Color(0xFFF44336),
                borderColor: const Color(0xFFF44336),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}