

import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';
import 'add_carddddd.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(text: 'Payment Method', text1:''),
                const SizedBox(
                  height: 30,
                ),
                const Text1(
                  text1: 'Credit Cards',
                  size: 21,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 5),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/debitcard.png',
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text2(text2: 'Add New Card'),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColors.buttonColor,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.buttonColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text1(
                  text1: 'More payment Options',
                  size: 20,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset(
                          'images/card.png',
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text2(text2: 'Master Card'),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColors.buttonColor,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset(
                          'images/icons8-apple-logo-50.png',
                          width: 24,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text2(text2: 'Apple Pay'),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColors.buttonColor,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>  const AddddCarddd()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
