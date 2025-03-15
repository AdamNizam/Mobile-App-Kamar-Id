import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';

import '../Constants/colors.dart';
import '../Screens/HomeScreen/details_screen.dart';
import '../Widgets/detailstext1.dart';
import '../Widgets/detailstext2.dart';
import '../Widgets/text11.dart';

class EventsCard extends StatefulWidget {
  final HotelAllModel hotel;

  const EventsCard({
    super.key,
    required this.hotel,
  });

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(slug: widget.hotel.slug),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 190,
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.hotel.bannerImageId != null &&
                          widget.hotel.bannerImageId!.isNotEmpty
                      ? Image.network(
                          widget.hotel.bannerImageId.toString(),
                          width: 190,
                          height: 130.0,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'images/no-image.jpg',
                          fit: BoxFit.cover,
                          width: 190,
                          height: 130.0,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text1(
                            text1: widget.hotel.title.toString(),
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
                          widget.hotel.address != null
                              ? Expanded(
                                  child: Text2(
                                    text2: widget.hotel.address.toString(),
                                  ),
                                )
                              : const Text2(text2: 'No-data'),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              widget.hotel.price != null
                                  ? Text1(
                                      text1:
                                          "\$${widget.hotel.price.toString()}",
                                      size: 18,
                                      color: AppColors.tabColor,
                                    )
                                  : const Text1(
                                      text1: '0',
                                      size: 18,
                                      color: AppColors.tabColor,
                                    ),
                              const Text2(text2: '/night'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              widget.hotel.starRate != null
                                  ? widget.hotel.starRate!.toInt()
                                  : 1,
                              (index) => Icon(
                                Icons.star,
                                size: 20.0,
                                color: index <
                                        double.tryParse(widget.hotel.reviewScore
                                                ?.toString() ??
                                            '0.0')!
                                    ? AppColors.tabColor
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          widget.hotel.reviewScore != null
                              ? Text2(
                                  text2: widget.hotel.reviewScore.toString())
                              : const Text('0.0'),
                          const Spacer(),
                          Text11(
                            text2:
                                '10% Off ${widget.hotel.isFeatured.toString()}',
                            color: AppColors.tabColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
            (widget.hotel.isFeatured == 1)
                ? Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.redAwesome,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
