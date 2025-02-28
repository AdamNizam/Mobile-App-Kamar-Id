//
// import 'package:flutter/material.dart';
// import 'package:ticket_widget/ticket_widget.dart';
//
// import '../../Widgets/custom_outline_button.dart';
// import '../../Widgets/customapp_bar.dart';
// import '../../Widgets/custombtn.dart';
// import '../../Widgets/detailstext1.dart';
// import '../../Widgets/detailstext2.dart';
// import 'get_directtion.dart';
//
// class ETicket extends StatelessWidget {
//   const ETicket({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children:[
//                      CustomAppBar(text: 'E-Ticket', text1: ''),
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     Expanded(
//                       child: TicketWidget(
//                         width: double.infinity,
//                         height: double.infinity,
//                         padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
//                         isCornerRounded: true,
//
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset('images/LivePerformances.jpg'),
//                             ),
//                             const Text2(
//
//                               text2: 'Name',
//
//                             ),
//                             const Text1( text1:  'Jason Marz',
//
//                             ),
//                             const SizedBox(height: 4),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TicketColumn(
//                                   text1: 'Date',
//                                   text2: '12 Jun,2024',
//                                 ), TicketColumn(
//                                   text1: 'Time',
//                                   text2: '07:00 PM',
//                                 ),
//
//                               ],
//                             ),
//                             const SizedBox(height:55),
//
//
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                                 TicketRow(),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TicketColumn(
//                                   text1: 'Seat',
//                                   text2: 'Unox A, 32',
//                                 ),
//                                 TicketColumn(
//                                   text1: 'Location',
//                                   text2: '07:00 PM',
//                                 ),
//
//
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TicketColumn(
//                                   text1: 'Event Name',
//                                   text2: 'LivePerformances',
//                                 ),
//                                 TicketColumn(
//                                   text1: 'Ticket Type',
//                                   text2: 'VIP',
//                                 ),
//
//
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Image.asset('images/580.png'),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             CustomButton(text: 'Download E-Ticket', onTap:(){}),
//                             CustomOutlinedButton(text: 'Get Direction', onTap:(){
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) =>  const GetDirectionScreen()));
//
//                             }),
//
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]
//
//
//
//               )
//           ),
//         ));
//   }
// }
//
// class TicketColumn extends StatelessWidget {
//   final String text1,text2;
//   const TicketColumn({
//     super.key, required this.text1, required this.text2,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text2( text2:text1,
//
//         ),
//         const SizedBox(height: 3),
//         Text1( text1:text2,
//
//         ),
//       ],
//     );
//   }
// }
//
// class TicketRow extends StatelessWidget {
//   const TicketRow({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 3),
//       width: 10,
//       height: 3,
//       decoration: BoxDecoration(
//         color: Colors.grey[300],
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
