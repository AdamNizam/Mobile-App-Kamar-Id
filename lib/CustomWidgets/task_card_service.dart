import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class TaskCardService extends StatefulWidget {
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
  TaskCardServiceState createState() => TaskCardServiceState();
}

class TaskCardServiceState extends State<TaskCardService> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColors.beauBlue,
          width: 2,
        ),
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
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildStatusIndicator(widget.statusColor),
                    _buildStatusIndicator(Colors.grey.shade300),
                    _buildStatusIndicator(Colors.grey.shade300),
                  ],
                ),
              ],
            ),
            Text(
              widget.clientName,
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
