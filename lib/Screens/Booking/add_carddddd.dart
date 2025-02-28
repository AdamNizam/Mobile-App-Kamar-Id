import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_summary.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/detailstext2.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';

class AddddCarddd extends StatelessWidget {
  const AddddCarddd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const CustomAppBar(text: 'Add Card', text1:''),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('images/card1.png'),
                      const SizedBox(width: 8,),
                      Image.asset('images/card2.png'),


                    ],

                  ),
                ),
                const SizedBox(height: 20,),
                const CustomTextField(label: 'Enter Card Holder Name',icon: Icons.person,),
                const SizedBox(height: 5,),

                const CustomTextField(label: 'Enter Card Number',icon: Icons.person,),
                const SizedBox(height: 6,),
                const Row(
                  children: [
                    Flexible(child: CustomTextField(label: '02/30',icon: Icons.date_range,)),
                    SizedBox(width: 10,),

                    Flexible(child: CustomTextField(label: '000',icon: Icons.numbers,)),
                  ],

                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.buttonColor
                      ),
                      child: const Icon(Icons.check,size: 14,color: Colors.white,),


                    ),
                    const SizedBox(width: 8,),
                    const Text2(text2: 'Save Card')
                  ],
                ),

                const Spacer(),
                CustomButton(
                  text: 'Add Card',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const ReviewSummary()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
