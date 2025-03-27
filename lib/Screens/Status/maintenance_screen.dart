import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 100, color: AppColors.buttonColor),
            SizedBox(height: 20),
            Text(
              "You're Offline",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
