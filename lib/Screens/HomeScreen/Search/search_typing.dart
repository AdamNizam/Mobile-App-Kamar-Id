import 'package:flutter/material.dart';

import '../../../CustomWidgets/CustomBar/customapp_bar.dart';
import '../../../CustomWidgets/CustomButton/custombtn.dart';
import '../../../CustomWidgets/CustomText/customtextfield.dart';
import '../../../CustomWidgets/CustomText/detailstext1.dart';
import '../../../CustomWidgets/CustomText/detailstext2.dart';

class SearchTyping extends StatelessWidget {
  const SearchTyping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: 'Search Hotels', text1: ''),
              SizedBox(height: 15),
              CustomTextField(
                label: 'Search for hotels, locations, or amenities',
                icon: Icons.search,
                icon2: Icons.cancel,
              ),
              Text1(text1: 'Recent Searches', size: 18),
              SizedBox(height: 15),
              SearchRow(
                text1: 'Beach Resorts',
                text2: 'City Hotels',
              ),
              SearchRow(
                text1: 'Luxury Suites',
                text2: 'Budget Stays',
              ),
              SearchRow(
                text1: 'Family Friendly',
                text2: 'Pet Friendly',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
        child: CustomButton(
          text: 'Search',
          onTap: () {},
        ),
      ),
    );
  }
}

class SearchRow extends StatelessWidget {
  final String text1, text2;
  const SearchRow({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text2(
            text2: text1,
          ),
          const SizedBox(width: 5),
          Text1(text1: text2),
          const Spacer(),
          Image.asset('images/arrow-up-right.png')
        ],
      ),
    );
  }
}
