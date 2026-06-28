// lib/presentation/screens/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/animations/fade_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import '../../widgets/buttons/primary_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _steamAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _steamAnimation = Tween<double>(begin: 0.0, end: -20.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2D1B14),
              Color(0xFF4E342E),
              Color(0xFF3E2723),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          animation: _fadeAnimation,
                          child: ScaleAnimation(
                            animation: _scaleAnimation,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image.network(
                                    'https://picsum.photos/seed/coffeeCup/400/400',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4E342E),
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        child: const Icon(
                                          Icons.coffee,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  child: AnimatedBuilder(
                                    animation: _steamAnimation,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(0, _steamAnimation.value),
                                        child: Opacity(
                                          opacity: 0.6,
                                          child: SvgPicture.network(
                                            'https://api.iconify.design/lucide/coffee.svg?color=white&width=48&height=48',
                                            width: 48,
                                            height: 48,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        FadeAnimation(
                          animation: _fadeAnimation,
                          delay: 0.3,
                          child: Text(
                            'Brew Coffee',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        FadeAnimation(
                          animation: _fadeAnimation,
                          delay: 0.5,
                          child: Text(
                            'Every sip tells a story',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  animation: _fadeAnimation,
                  delay: 0.7,
                  child: PrimaryButton(
                    text: 'Get Started',
                    onPressed: () {
                      context.go(AppRoutes.onboarding);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}