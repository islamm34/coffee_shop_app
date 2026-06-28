// lib/presentation/routes/router.dart
import 'package:coffee_shop_app/presentation/screens/about/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/cart/cart_screen.dart';
import '../../screens/categories/categories_screen.dart';
import '../../screens/checkout/checkout_screen.dart';
import '../../screens/forgot_password/forgot_password_screen.dart';
import '../../screens/help_center/help_center_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/notifications/notifications_screen.dart';
import '../../screens/offers/offers_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/order_success/order_success_screen.dart';
import '../../screens/order_tracking/order_tracking_screen.dart';
import '../../screens/otp/otp_verification_screen.dart';
import '../../screens/payment/payment_screen.dart';
import '../../screens/product_details/product_details_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/register/register_screen.dart';
import '../../screens/settings/settings_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/wallet/wallet_screen.dart';
import '../../screens/welcome/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String orderSuccess = '/order-success';
  static const String orderTracking = '/order-tracking';
  static const String profile = '/profile';
  static const String wallet = '/wallet';
  static const String offers = '/offers';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String helpCenter = '/help-center';
  static const String about = '/about';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      name: 'welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.otp,
      name: 'otp',
      builder: (context, state) => const OTPVerificationScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.categories,
      name: 'categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      name: 'product-details',
      builder: (context, state) => const ProductDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.cart,
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRoutes.checkout,
      name: 'checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: AppRoutes.payment,
      name: 'payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderSuccess,
      name: 'order-success',
      builder: (context, state) => const OrderSuccessScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderTracking,
      name: 'order-tracking',
      builder: (context, state) => const OrderTrackingScreen(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.wallet,
      name: 'wallet',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: AppRoutes.offers,
      name: 'offers',
      builder: (context, state) => const OffersScreen(),
    ),
    GoRoute(
      path: AppRoutes.notifications,
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.helpCenter,
      name: 'help-center',
      builder: (context, state) => const HelpCenterScreen(),
    ),
    GoRoute(
      path: AppRoutes.about,
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Color(0xFFF44336),
          ),
          const SizedBox(height: 16),
          Text(
            'Page not found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'The page you are looking for does not exist.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.home),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4E342E),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
);
