import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHotelCard extends StatelessWidget {
  const ShimmerHotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 18, width: 150, color: Colors.white),
            const SizedBox(height: 8),
            Container(height: 14, width: 250, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 14, width: 100, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class ShimmerEventsCard extends StatelessWidget {
  const ShimmerEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
