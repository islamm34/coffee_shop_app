// lib/presentation/screens/product_details/product_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
import '../../widgets/buttons/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _selectedSize = 'M';
  String _selectedMilk = 'Oat';
  bool _extraShot = false;
  int _quantity = 1;

  final List<String> _sizes = ['S', 'M', 'L'];
  final List<String> _milkOptions = ['Whole', 'Oat', 'Almond', 'Soy'];

  bool _addWhippedCream = false;
  bool _addChocolateSauce = false;
  bool _addExtraSyrup = false;

  @override
  Widget build(BuildContext context) {
    final bool isDessert = false;
    final String productName = isDessert ? 'Chocolate Croissant' : 'Caramel Macchiato';
    final String productPrice = isDessert ? '\$4.50' : '\$5.50';
    final String productImage = isDessert
        ? 'https://picsum.photos/seed/productDessert/600/500'
        : 'https://picsum.photos/seed/productCoffee/600/500';
    final String productDescription = isDessert
        ? 'Freshly baked croissant with rich chocolate filling'
        : 'Caramel drizzle with vanilla beans';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'product_image',
                child: Image.network(
                  productImage,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 350,
                      width: double.infinity,
                      color: const Color(0xFFF8F5F2),
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Color(0xFF7D6E63),
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC89B6D),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 48,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      // العودة إلى الصفحة الرئيسية
                      context.go(AppRoutes.home);
                    },
                    icon: SvgPicture.network(
                      'https://api.iconify.design/lucide/arrow-left.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 48,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.network(
                      'https://api.iconify.design/lucide/heart.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productName,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2D2A26),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F5F2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.network(
                                'https://api.iconify.design/lucide/star.svg',
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFC89B6D),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2D2A26),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      productDescription,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7D6E63),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      productPrice,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4E342E),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (!isDessert) ...[
                      Text(
                        'Select Size',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: _sizes.map((size) {
                          final isSelected = size == _selectedSize;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF4E342E)
                                    : const Color(0xFFF8F5F2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF4E342E)
                                      : Colors.transparent,
                                ),
                              ),
                              child: Text(
                                size,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF7D6E63),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Milk Preference',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _milkOptions.map((milk) {
                          final isSelected = milk == _selectedMilk;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedMilk = milk;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFC89B6D)
                                    : const Color(0xFFF8F5F2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                milk,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF7D6E63),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Extra Shot',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D2A26),
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            value: _extraShot,
                            onChanged: (value) {
                              setState(() {
                                _extraShot = value;
                              });
                            },
                            activeColor: const Color(0xFF4E342E),
                          ),
                        ],
                      ),
                    ],
                    if (isDessert) ...[
                      Text(
                        'Add Extras',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _extraOptionTile(
                              'Whipped Cream',
                              _addWhippedCream,
                                  (value) => setState(() => _addWhippedCream = value),
                            ),
                          ),
                          Expanded(
                            child: _extraOptionTile(
                              'Chocolate Sauce',
                              _addChocolateSauce,
                                  (value) => setState(() => _addChocolateSauce = value),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _extraOptionTile(
                        'Extra Syrup',
                        _addExtraSyrup,
                            (value) => setState(() => _addExtraSyrup = value),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D2A26),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F5F2),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.network(
                                  'https://api.iconify.design/lucide/minus.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '$_quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2D2A26),
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4E342E),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      text: 'Add to Cart - ${_calculateTotalPrice()}',
                      onPressed: () {
                        context.go(AppRoutes.cart);
                      },
                      fullWidth: true,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _calculateTotalPrice() {
    final double basePrice = 5.50;
    final double total = basePrice * _quantity;
    return '\$${total.toStringAsFixed(2)}';
  }

  Widget _extraOptionTile(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF2D2A26),
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFFC89B6D),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}