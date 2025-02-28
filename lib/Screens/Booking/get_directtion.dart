import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/you_havearrived.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';

class GetDirectionScreen extends StatelessWidget {
  const GetDirectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Transparent AppBar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'Get Direction',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Handle share button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.black),
            onPressed: () {
              // Handle bookmark button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Replace with your static map image
          Image.asset(
            'images/map.PNG', // Update with your image path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Positioned for the blue circle
          Positioned(
            top: 130, // Adjust vertical position as needed
            left: 130, // Adjust horizontal position as needed
            child: Center(child: CircleAvatar(
                backgroundColor: AppColors.buttonColor,
                radius: 22,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 14,
                      child: Image.asset('images/c2.png')),
                ))),
          ),
          // Positioned for the black circle with arrow
          const Positioned(
            top: 370, // Adjust vertical position as needed
            left: 180, // Adjust horizontal position as needed
            child: Center(child: CircleAvatar(
                backgroundColor: AppColors.buttonColor,
                radius: 22,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: AppColors.buttonColor,
                      radius: 14,
                      child: Icon(Icons.arrow_upward,color: Colors.white,)),
                ))),
          ),
          // Draw the line
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: MyLinePainter(
              startPoint: const Offset(150, 170), // Adjust coordinates of start point
              endPoint: const Offset(200, 370), // Adjust coordinates of end point
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Center(
                child: CustomButton(text: 'Start', onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const YouHaveArrived()));

                })
            ),
          ),        ],
      ),
    );
  }
}

class MyLinePainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;

  MyLinePainter({required this.startPoint, required this.endPoint});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Line color
      ..strokeWidth = 4 // Line thickness
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}