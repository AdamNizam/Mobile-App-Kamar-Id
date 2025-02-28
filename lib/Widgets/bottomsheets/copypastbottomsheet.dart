// import 'package:eventbookingmanagementapp/Screens/Booking/book_hotel.dart';
// import 'package:flutter/material.dart';
// import 'package:ticket_widget/ticket_widget.dart';
//
// import '../../Constants/colors.dart';
// import '../../Screens/Booking/choose_ticker.dart';
// import '../custom_outline_button.dart';
// import '../custombtn.dart';
// import '../customtextfield.dart';
// import '../detailstext1.dart';
// import '../detailstext2.dart';
// import '../text11.dart';
//
// class BottomSheetWidget {
//   static void addAddressBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: AppColors.bgColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           topRight: Radius.circular(15.0),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           height: MediaQuery.of(context).size.height * 0.80,
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text1(
//                 text1: 'Save Address',
//                 size: 18,
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               const CustomTextField(
//                 icon: Icons.person_outline,
//                 label: 'Full Name',
//               ),
//               const CustomTextField(
//                 icon: Icons.phone,
//                 label: 'Phone Number',
//               ),
//               const CustomTextField(
//                 icon: Icons.email,
//                 label: 'Email Address',
//               ),
//               const CustomTextField(
//                 icon: Icons.location_on,
//                 label: 'Street Address',
//               ),
//               const CustomTextField(
//                 icon: Icons.location_city,
//                 label: 'City',
//               ),
//               const CustomTextField(
//                 icon: Icons.map,
//                 label: 'State',
//               ),
//               const CustomTextField(
//                 icon: Icons.markunread_mailbox,
//                 label: 'Zip Code',
//               ),
//               const CustomTextField(
//                 icon: Icons.location_on,
//                 label: 'Country',
//               ),
//               const CustomTextField(
//                 icon: Icons.apartment,
//                 label: 'Floor',
//               ),
//               const CustomTextField(
//                 icon: Icons.apartment,
//                 label: 'Landmark',
//               ),
//               const SizedBox(
//                 height: 11,
//               ),
//               CustomButton(text: 'Save Address', onTap: () {})
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   static void removeBookMarksBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: AppColors.bgColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           topRight: Radius.circular(15.0),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           height: MediaQuery.of(context).size.height * 0.29,
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Center(
//                   child: Text1(
//                 text1: 'Remove from Bookmark?',
//                 size: 18,
//               )),
//               const SizedBox(
//                 height: 12,
//               ),
//               Container(
//                 width: double.infinity,
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             'images/OilChange.jpg',
//                             fit: BoxFit.cover,
//                             width: 100,
//                             height: 90,
//                           ),
//                         ),
//                         const SizedBox(width: 14),
//                         const Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 1),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text11(
//                                       text2: 'Car Washing Service',
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Spacer(),
//                                     Icon(Icons.bookmark,
//                                         color: AppColors.buttonColor),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text1(
//                                       text1: 'Oil Change Service',
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       size: 19,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 19,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 19,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 19,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 19,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                     Text2(text2: ' (4.5)')
//                                   ],
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Icon(
//                                           Icons.location_on,
//                                           size: 18,
//                                           color: AppColors.buttonColor,
//                                         ),
//                                         Text2(text2: '0.5 km')
//                                       ],
//                                     ),
//                                     SizedBox(width: 10),
//                                     Row(
//                                       children: [
//                                         Icon(
//                                           Icons.timelapse_outlined,
//                                           size: 18,
//                                           color: AppColors.buttonColor,
//                                         ),
//                                         Text2(text2: ' 2 Mins')
//                                       ],
//                                     ),
//                                     Spacer(),
//                                     Text1(
//                                       text1: '\$1200',
//                                       size: 16,
//                                       color: AppColors.buttonColor,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 11,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                       child: CustomOutlinedButton(
//                           text: 'Cancel',
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           })),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: CustomButton(text: 'Yes Remove', onTap: () {})),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // ... your existing addAddressBottomSheet
//
//   // Declare _selectedTicketIndex as a property of the class
//   static int _selectedTicketIndex = 0;
//
//   static void chooseTicketBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: AppColors.bgColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           topRight: Radius.circular(15.0),
//         ),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             // No need to redeclare _selectedTicketIndex here
//
//             return Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               height: MediaQuery.of(context).size.height * 0.4,
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Choose Ticket',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _selectedTicketIndex = 0;
//                           });
//                         },
//                         child: Container(
//                           width: 170,
//                           height: 160,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: _selectedTicketIndex == 0
//                                   ? Colors.orange
//                                   : Colors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TicketWidget(
//                             width: 160,
//                             height: 160,
//                             isCornerRounded: true,
//                             padding: const EdgeInsets.all(15),
//                             child: TicketOption(
//                               title: 'VIP',
//                               price: '\$50.00',
//                               description:
//                                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                               priceColor: _selectedTicketIndex == 0
//                                   ? Colors.blue
//                                   : Colors.black,
//                               iconColor: _selectedTicketIndex == 0
//                                   ? Colors.blue
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _selectedTicketIndex = 1;
//                           });
//                         },
//                         child: Container(
//                           width: 170,
//                           height: 160,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: _selectedTicketIndex == 1
//                                   ? Colors.orange
//                                   : Colors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TicketWidget(
//                             width: 160,
//                             height: 160,
//                             isCornerRounded: true,
//                             padding: const EdgeInsets.all(15),
//                             child: TicketOption(
//                               title: 'Economy',
//                               price: '\$30.00',
//                               description:
//                                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                               priceColor: _selectedTicketIndex == 1
//                                   ? Colors.blue
//                                   : Colors.black,
//                               iconColor: _selectedTicketIndex == 1
//                                   ? Colors.blue
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: CustomButton(
//                       text: 'Confirm',
//                       onTap: () {
//                         // Handle the ticket selection logic
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) =>  const BookTicket()));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // ... your other BottomSheetWidget methods
// }
//
// // ... (Your other widgets: CustomTextField, CustomOutlinedButton, CustomButton, DashedBorderPainter)
