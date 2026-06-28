// lib/presentation/screens/payment/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/primary_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPayment = 'credit_card';

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'id': 'credit_card',
      'name': 'Credit Card',
      'icon': 'https://api.iconify.design/lucide/credit-card.svg',
      'details': '**** **** **** 1234',
    },
    {
      'id': 'apple_pay',
      'name': 'Apple Pay',
      'icon': 'https://api.iconify.design/logos/apple.svg',
      'details': '',
    },
    {
      'id': 'google_pay',
      'name': 'Google Pay',
      'icon': 'https://api.iconify.design/logos/google-pay.svg',
      'details': '',
    },
    {
      'id': 'wallet',
      'name': 'Wallet Balance',
      'icon': 'https://api.iconify.design/lucide/wallet.svg',
      'details': '\$45.00 available',
    },
    {
      'id': 'cash',
      'name': 'Cash',
      'icon': 'https://api.iconify.design/lucide/coins.svg',
      'details': 'Pay on delivery',
    },
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
            context.go(AppRoutes.checkout);
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
          'Payment',
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
            Text(
              'Select Payment Method',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D2A26),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  final isSelected = method['id'] == _selectedPayment;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPayment = method['id'];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF4E342E).withOpacity(0.05)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF4E342E)
                              : const Color(0xFFE8E0DA),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF4E342E)
                                  : const Color(0xFFF8F5F2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.network(
                              method['icon'],
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                isSelected
                                    ? Colors.white
                                    : const Color(0xFF4E342E),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  method['name'],
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF2D2A26),
                                  ),
                                ),
                                if (method['details'].isNotEmpty)
                                  Text(
                                    method['details'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color(0xFF7D6E63),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D2A26),
                    ),
                  ),
                  Text(
                    '\$13.50',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4E342E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Pay Now',
              onPressed: () {
                context.go(AppRoutes.orderSuccess);
              },
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}