// lib/presentation/screens/cart/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../constants/image_constants.dart';
import '../../widgets/buttons/primary_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _hasPromo = false;

  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Caramel Macchiato', 'price': 5.50, 'quantity': 2, 'size': 'M', 'image': ImageConstants.coffee1},
    {'name': 'Croissant', 'price': 3.50, 'quantity': 1, 'size': '', 'image': ImageConstants.dessert1},
    {'name': 'Iced Americano', 'price': 4.50, 'quantity': 1, 'size': 'L', 'image': ImageConstants.coffee2},
    {'name': 'Cheesecake', 'price': 6.00, 'quantity': 1, 'size': '', 'image': ImageConstants.dessert2},
    {'name': 'Vanilla Latte', 'price': 5.00, 'quantity': 1, 'size': 'M', 'image': ImageConstants.coffee4},
  ];

  @override
  Widget build(BuildContext context) {
    final subtotal = _cartItems.fold<double>(
      0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
    final deliveryFee = 2.50;
    final total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
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
        ),        title: Text(
          'My Cart (${_cartItems.length})',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2A26),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.network(
              'https://api.iconify.design/lucide/trash-2.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFFF44336),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          item['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 70,
                              height: 70,
                              color: const Color(0xFFF8F5F2),
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Color(0xFF7D6E63),
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2D2A26),
                                fontSize: 15,
                              ),
                            ),
                            if (item['size'].isNotEmpty)
                              Text(
                                'Size: ${item['size']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: const Color(0xFF7D6E63),
                                ),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${item['price'].toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4E342E),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (item['quantity'] > 1) {
                                  item['quantity']--;
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F5F2),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                'https://api.iconify.design/lucide/minus.svg',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${item['quantity']}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2D2A26),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item['quantity']++;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4E342E),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, -6),
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _hasPromo = !_hasPromo;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F5F2),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: _hasPromo ? const Color(0xFFC89B6D) : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.network(
                          'https://api.iconify.design/lucide/gift.svg',
                          width: 22,
                          height: 22,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFC89B6D),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _hasPromo ? '🎉 Promo code applied' : 'Add promo code',
                          style: GoogleFonts.poppins(
                            color: _hasPromo ? const Color(0xFFC89B6D) : const Color(0xFF7D6E63),
                            fontWeight: _hasPromo ? FontWeight.w500 : FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.network(
                          _hasPromo
                              ? 'https://api.iconify.design/lucide/check-circle.svg'
                              : 'https://api.iconify.design/lucide/chevron-right.svg',
                          width: 22,
                          height: 22,
                          colorFilter: ColorFilter.mode(
                            _hasPromo ? const Color(0xFF4CAF50) : const Color(0xFF7D6E63),
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7D6E63),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$${subtotal.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2D2A26),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7D6E63),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$${deliveryFee.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2D2A26),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                if (_hasPromo) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF4CAF50),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '-\$3.00',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF4CAF50),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
                const Divider(height: 24, thickness: 1, color: Color(0xFFE8E0DA)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D2A26),
                      ),
                    ),
                    Text(
                      _hasPromo
                          ? '\$${(total - 3.0).toStringAsFixed(2)}'
                          : '\$${total.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4E342E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                PrimaryButton(
                  text: 'Proceed to Checkout',
                  onPressed: () {
                    context.go(AppRoutes.checkout);
                  },
                  fullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}