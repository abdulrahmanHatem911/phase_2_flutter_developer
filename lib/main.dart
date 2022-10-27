import 'package:flutter/material.dart';
import 'package:phase_2_flutter_developer/core/style/theme/theme.dart';
import 'package:phase_2_flutter_developer/presentation/screens/product_ditails.dart';
import 'package:phase_2_flutter_developer/presentation/screens/web_scroping_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ProductDetails(),
    );
  }
}
