import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Widgets/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custom_icon2_avaibility.dart';

class CardAvailbility extends StatelessWidget {
  const CardAvailbility({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 330, // Sesuaikan ukuran kartu
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://picsum.photos/400/300", // Ganti dengan gambar asli
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Detail Kamar
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      "Room 1",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomIcon1Avaibility(
                          icon: Icons.access_time, name: '50 m2'),
                      CustomIcon1Avaibility(
                          icon: Icons.airplanemode_on, name: 'x2'),
                      CustomIcon1Avaibility(
                          icon: Icons.vaping_rooms, name: 'x30'),
                      CustomIcon1Avaibility(
                          icon: Icons.breakfast_dining, name: 'Timer'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomIcon2Avaibility(
                        icon: Icons.access_time,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.tv,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.wifi,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.local_cafe,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
