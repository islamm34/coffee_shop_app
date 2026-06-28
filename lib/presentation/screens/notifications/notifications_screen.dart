// lib/presentation/screens/notifications/notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}
class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _notifications = [
    {'title': 'Order Delivered', 'message': 'Your order #12345 has been delivered successfully.', 'time': '5 min ago', 'isRead': false, 'icon': 'package'},
    {'title': 'Special Offer', 'message': 'Get 20% off on your next order with code: COFFEE20', 'time': '2 hours ago', 'isRead': false, 'icon': 'gift'},
    {'title': 'Order Confirmed', 'message': 'Your order #12344 has been confirmed and is being prepared.', 'time': 'Yesterday', 'isRead': true, 'icon': 'check-circle'},
    {'title': 'Welcome to Brew Coffee', 'message': 'Thank you for joining us. Enjoy your first coffee on us!', 'time': '2 days ago', 'isRead': true, 'icon': 'coffee'},
    {'title': 'Payment Received', 'message': 'Your payment of \$5.50 has been received successfully.', 'time': '3 days ago', 'isRead': true, 'icon': 'credit-card'},
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
            // العودة إلى الصفحة الرئيسية
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
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2A26),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var notification in _notifications) {
                  notification['isRead'] = true;
                }
              });
            },
            child: Text(
              'Mark all read',
              style: GoogleFonts.poppins(
                color: const Color(0xFFC89B6D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: notification['isRead'] ? Colors.white : const Color(0xFFFFF8F0),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: notification['isRead']
                        ? const Color(0xFFF8F5F2)
                        : const Color(0xFFC89B6D).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.network(
                    'https://api.iconify.design/lucide/${notification['icon']}.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      notification['isRead']
                          ? const Color(0xFF7D6E63)
                          : const Color(0xFFC89B6D),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['title'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D2A26),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['message'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF7D6E63),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['time'],
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: const Color(0xFFBDBDBD),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!notification['isRead'])
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC89B6D),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}