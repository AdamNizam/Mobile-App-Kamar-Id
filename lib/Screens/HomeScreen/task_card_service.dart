import 'package:flutter/material.dart';

class TaskCardService extends StatelessWidget {
  final String title;
  final String clientName;
  final Color backgroundColor;
  final Color statusColor;

  const TaskCardService({
    super.key,
    required this.title,
    required this.clientName,
    required this.backgroundColor,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // Pastikan title ada di sini
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildStatusIndicator(statusColor),
                    _buildStatusIndicator(Colors.grey.shade300),
                    _buildStatusIndicator(Colors.grey.shade300),
                  ],
                ),
              ],
            ),
            Text(
              clientName, // Pastikan clientName ada di sini
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        width: 16,
        height: 8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
