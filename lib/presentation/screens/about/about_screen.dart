// lib/presentation/screens/about/about_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
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
          'About',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2A26),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
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
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4E342E),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: SvgPicture.network(
                        'https://api.iconify.design/lucide/coffee.svg',
                        width: 40,
                        height: 40,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Brew Coffee',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D2A26),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF7D6E63),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
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
                  Text(
                    'Our Story',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D2A26),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Brew Coffee was founded with a simple mission: to bring the perfect cup of coffee to everyone. We source our beans from the best farms around the world and roast them with care to bring out the unique flavors of each origin.',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF7D6E63),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
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
                  Text(
                    'Connect With Us',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D2A26),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _socialButton(
                        'https://api.iconify.design/logos/instagram-icon.svg',
                            () {},
                      ),
                      const SizedBox(width: 8),
                      _socialButton(
                        'https://api.iconify.design/logos/twitter.svg',
                            () {},
                      ),
                      const SizedBox(width: 8),
                      _socialButton(
                        'https://api.iconify.design/logos/facebook.svg',
                            () {},
                      ),
                      const SizedBox(width: 8),
                      _socialButton(
                        'https://api.iconify.design/logos/youtube-icon.svg',
                            () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Made with ❤️',
              style: GoogleFonts.poppins(
                color: const Color(0xFF7D6E63),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(String icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F5F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.network(
          icon,
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}