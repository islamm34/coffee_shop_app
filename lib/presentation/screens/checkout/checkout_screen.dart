// lib/presentation/screens/checkout/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/primary_button.dart';

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
      backgroundColor: const Color(0xFFF8F5F2),
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
            colorFilter: const ColorFilter.mode(
              Color(0xFF4E342E),
              BlendMode.srcIn,
            ),
          ),
        ),        title: Text(
          'Checkout',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            Text(
              'Delivery Address',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D2A26),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
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
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF4E342E)
                                    : const Color(0xFFE8E0DA),
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? Container(
                              margin: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xFF4E342E),
                                shape: BoxShape.circle,
                              ),
                            )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address['label']!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF2D2A26),
                                  ),
                                ),
                                Text(
                                  address['details']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF7D6E63),
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
                                Color(0xFF4CAF50),
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
            const SizedBox(height: 16),
            // Delivery Time
            Text(
              'Delivery Time',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D2A26),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
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
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                      isSelected ? const Color(0xFF4E342E) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF4E342E)
                            : const Color(0xFFE8E0DA),
                      ),
                    ),
                    child: Text(
                      time,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color:
                        isSelected ? Colors.white : const Color(0xFF7D6E63),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Order Summary
            Text(
              'Order Summary',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D2A26),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_cartItems.length} items',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF7D6E63),
                        ),
                      ),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF7D6E63),
                        ),
                      ),
                      Text(
                        '\$${deliveryFee.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
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
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4E342E),
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