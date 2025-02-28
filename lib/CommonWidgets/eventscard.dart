import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Screens/HomeScreen/details_screen.dart';
import '../Widgets/detailstext1.dart';
import '../Widgets/detailstext2.dart';
import '../Widgets/text11.dart';

class EventsCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String date;
  final String price;

  const EventsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.date,
    required this.price,
  });

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HotelDetailsScreen()));
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(widget.imageUrl,
                  width: 200, height: 150.0, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text1(
                        text1: widget.title,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 23.0,
                        color: AppColors.tabColor,
                      ),
                      const SizedBox(width: 4.0),
                      Text2(
                        text2: widget.location,
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20.0,
                            color: AppColors.tabColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 20.0,
                            color: AppColors.tabColor,
                          ),
                        ],
                      ),
                      Text2(
                        text2: widget.date,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Row(
                    children: [
                      Text11(
                        text2: '10% Off',
                        color: AppColors.tabColor,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text1(
                            text1: '\$12.00',
                            size: 18,
                            color: AppColors.tabColor,
                          ),
                          Text2(text2: '/night')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
