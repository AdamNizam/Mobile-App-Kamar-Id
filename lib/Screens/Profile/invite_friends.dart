import 'package:flutter/material.dart';

import '../../Widgets/customapp_bar.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

class InviteFriendsScreen extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {'name': 'Carla Schoen', 'phone': '207.555.0119', 'image': 'images/c2.png'},
    {'name': 'Esther Howard', 'phone': '702.555.0122', 'image': 'images/c3.png'},
    {'name': 'Robert Fox', 'phone': '239.555.0108', 'image': 'images/c4.png'},
    {'name': 'Jacob Jones', 'phone': '316.555.0116', 'image': 'images/c5.png'},
    {'name': 'Carla Schoen', 'phone': '207.555.0119', 'image': 'images/c2.png'},
    {'name': 'Esther Howard', 'phone': '702.555.0122', 'image': 'images/c3.png'},
    {'name': 'Robert Fox', 'phone': '239.555.0108', 'image': 'images/c4.png'},
    {'name': 'Jacob Jones', 'phone': '316.555.0116', 'image': 'images/c5.png'},
    {'name': 'Carla Schoen', 'phone': '207.555.0119', 'image': 'images/c2.png'},
    {'name': 'Esther Howard', 'phone': '702.555.0122', 'image': 'images/c3.png'},
    {'name': 'Robert Fox', 'phone': '239.555.0108', 'image': 'images/c4.png'},
    {'name': 'Jacob Jones', 'phone': '316.555.0116', 'image': 'images/c5.png'},
  ];

   InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.only(left: 12,right: 12,top: 10),
                child: CustomAppBar(text: 'Invite Friends', text1: ''),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(friends[index]['image']!),
                      ),
                      title: Text1(text1:  friends[index]['name']!),
                      subtitle: Text2(text2:  friends[index]['phone']!),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text1(text1: 'Invite',color: Colors.white,),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          
        ),
      )
    );
  }
}
