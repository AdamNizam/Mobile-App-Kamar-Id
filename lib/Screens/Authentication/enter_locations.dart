import 'package:flutter/material.dart';


import '../../Widgets/customapp_bar.dart';
import '../../Widgets/customtextfield.dart';

class EnterLocationScreen extends StatelessWidget {
  const EnterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: 'Enter Your Location', text1: ''),
              SizedBox(height: 16,),
              CustomTextField(label: 'Golden Avenue',icon: Icons.search,icon2: Icons.clear,),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.red),
                  SizedBox(width: 10,),
                  Text('Use my current location'),


                ],

              )
             ,
              SizedBox(height: 20),
              Text(
                'SEARCH RESULT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 7,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.red),
                      SizedBox(width: 10,),
                      Text('Golden Avenue'),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Text('8502 Preston Rd. Ingl...'),

                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}


