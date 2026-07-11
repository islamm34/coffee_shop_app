import 'package:coffee_shop_app/core/theme/app_theme.dart';
import 'package:coffee_shop_app/presentation/constants/routes/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: AppLightTheme.themeData(),
      darkTheme: AppDarkTheme.themeData(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
