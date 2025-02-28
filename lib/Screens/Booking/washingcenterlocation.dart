//
// import 'package:flutter/material.dart';
//
// import '../../Constants/colors.dart';
// import '../../Widgets/custombtn.dart';
// import 'get_directtion.dart';
//
// class WashingCenterLocationScreen extends StatelessWidget {
//   const WashingCenterLocationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Transparent AppBar
//         elevation: 0, // Remove shadow
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         title: const Text(
//           'Washing Center Location',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share, color: Colors.black),
//             onPressed: () {
//               // Handle share button press
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.bookmark, color: Colors.black),
//             onPressed: () {
//               // Handle bookmark button press
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Replace with your static map image
//           Image.asset(
//             'images/map.PNG', // Update with your image path
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//
//           // Positioned for the blue circle
//           Positioned(
//             top: 190, // Adjust vertical position as needed
//             left: 180, // Adjust horizontal position as needed
//             child: Center(child: CircleAvatar(
//                 backgroundColor: AppColors.buttonColor,
//               radius: 22,
//                 child: CircleAvatar(
//                   radius: 16,
//                   backgroundColor: Colors.white,
//                   child: CircleAvatar(
//                     radius: 14,
//                       child: Image.asset('images/c2.png')),
//                 ))),
//           ),
//           // Positioned for the black circle with arrow
//
//           Positioned(
//             bottom: 20,
//             left: 10,
//             right: 10,
//             child: Center(
//               child: CustomButton(text: 'Start', onTap:(){
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) =>  const GetDirectionScreen()));
//
//               })
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
