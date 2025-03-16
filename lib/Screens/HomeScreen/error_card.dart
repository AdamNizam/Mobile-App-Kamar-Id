import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String message;

  const ErrorCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Warna Card putih
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          // Garis vertikal merah
          const SizedBox(width: 15),
          Expanded(
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400, // Sedikit lebih tebal
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
