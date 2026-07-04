// lib/presentation/screens/checkout/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../../core/theme/app_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedAddress = 'Home';
  String _selectedTime = 'ASAP';

  final List<Map<String, String>> _addresses = [
    {'label': 'Home', 'details': 'Coffee Street 123, New York'},
    {'label': 'Work', 'details': 'Business Ave 456, New York'},
  ];

  final List<String> _deliveryTimes = ['ASAP', '15 min', '30 min', '45 min'];

  // تعريف بيانات السلة محلياً
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Caramel Macchiato', 'price': 5.50, 'quantity': 2},
    {'name': 'Croissant', 'price': 3.50, 'quantity': 1},
    {'name': 'Iced Americano', 'price': 4.50, 'quantity': 1},
  ];

  // حساب الإجمالي
  double get subtotal {
    return _cartItems.fold<double>(
      0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deliveryFee = 2.50;
    final total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.cart);
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
        ),        title: Text(
          'Checkout',
          style: AppTextStyles.titleMedium.copyWith(
            color: context.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: AppSpacing.paddingLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            Text(
              'Delivery Address',
              style: AppTextStyles.titleSmall.copyWith(
                color: context.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Container(
              padding: AppSpacing.paddingLg,
              decoration: BoxDecoration(
                color: context.cardBackground,
                borderRadius: AppRadius.lgRadius,
                boxShadow: AppShadows.cardShadow,
              ),
              child: Column(
                children: _addresses.map((address) {
                  final isSelected = address['label'] == _selectedAddress;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAddress = address['label']!;
                      });
                    },
                    child: Container(
                      padding: AppSpacing.paddingVerticalSm,
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? context.primaryColor
                                    : context.borderColor,
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: context.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            )
                                : null,
                          ),
                          AppSpacing.gapHorizontalMd,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address['label']!,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.textPrimary,
                                  ),
                                ),
                                Text(
                                  address['details']!,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: context.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            SvgPicture.network(
                              'https://api.iconify.design/lucide/check.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                AppColors.success,
                                BlendMode.srcIn,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            AppSpacing.gapLg,
            // Delivery Time
            Text(
              'Delivery Time',
              style: AppTextStyles.titleSmall.copyWith(
                color: context.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Wrap(
              spacing: AppSpacing.sm,
              children: _deliveryTimes.map((time) {
                final isSelected = time == _selectedTime;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color:
                      isSelected ? context.primaryColor : context.cardBackground,
                      borderRadius: AppRadius.mdRadius,
                      border: Border.all(
                        color: isSelected
                            ? context.primaryColor
                            : context.borderColor,
                      ),
                    ),
                    child: Text(
                      time,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color:
                        isSelected ? Colors.white : context.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            AppSpacing.gapLg,
            // Order Summary
            Text(
              'Order Summary',
              style: AppTextStyles.titleSmall.copyWith(
                color: context.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Container(
              padding: AppSpacing.paddingLg,
              decoration: BoxDecoration(
                color: context.cardBackground,
                borderRadius: AppRadius.lgRadius,
                boxShadow: AppShadows.cardShadow,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_cartItems.length} items',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.gapXs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                      Text(
                        '\$${deliveryFee.toStringAsFixed(2)}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.textPrimary,
                        ),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: AppTextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Continue to Payment',
              onPressed: () {
                context.go(AppRoutes.payment);
              },
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}