import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
