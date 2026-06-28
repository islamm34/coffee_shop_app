// lib/presentation/screens/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/routes/router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;

  final List<Map<String, dynamic>> _settingsItems = [
    {'icon': 'moon', 'title': 'Dark Mode', 'type': 'switch'},
    {'icon': 'bell', 'title': 'Push Notifications', 'type': 'switch'},
    {'icon': 'globe', 'title': 'Language', 'subtitle': 'English', 'type': 'tile'},
    {'icon': 'lock', 'title': 'Privacy', 'type': 'tile'},
    {'icon': 'help-circle', 'title': 'Help Center', 'type': 'tile'},
    {'icon': 'info', 'title': 'About', 'type': 'tile'},
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
            context.go(AppRoutes.profile);
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
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2A26),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _settingsItems.length,
        itemBuilder: (context, index) {
          final item = _settingsItems[index];
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
              subtitle: item['subtitle'] != null
                  ? Text(
                item['subtitle'],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xFF7D6E63),
                ),
              )
                  : null,
              trailing: item['type'] == 'switch'
                  ? Switch(
                value: item['title'] == 'Dark Mode' ? _darkMode : _notifications,
                onChanged: (value) {
                  setState(() {
                    if (item['title'] == 'Dark Mode') {
                      _darkMode = value;
                    } else {
                      _notifications = value;
                    }
                  });
                },
                activeColor: const Color(0xFF4E342E),
              )
                  : SvgPicture.network(
                'https://api.iconify.design/lucide/chevron-right.svg',
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF7D6E63),
                  BlendMode.srcIn,
                ),
              ),
              onTap: () {
                if (item['title'] == 'Help Center') {
                  context.go(AppRoutes.helpCenter);
                } else if (item['title'] == 'About') {
                  context.go(AppRoutes.about);
                }
              },
            ),
          );
        },
      ),
    );
  }
}