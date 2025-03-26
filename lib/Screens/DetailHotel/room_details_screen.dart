import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/customtextfield.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/facility_icon_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({super.key});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _controller = TextEditingController(text: "0");

  final List<String> _imageUrls = [
    'https://picsum.photos/800/400?random=1',
    'https://picsum.photos/800/400?random=2',
    'https://picsum.photos/800/400?random=3',
    'https://picsum.photos/800/400?random=4',
    'https://picsum.photos/800/400?random=5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 280,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _imageUrls.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  _imageUrls[index],
                                  height: 280,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 16,
                          child: iconBackButton(Icons.arrow_back, () {
                            Navigator.pop(context);
                          }),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              count: _imageUrls.length,
                              effect: ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: AppColors.white,
                                dotColor: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paradise Resort',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enjoy a luxurious stay with world-class facilities and stunning ocean views.',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Facilities Room',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              FacilityIconItem(
                                icon: Icons.pool,
                                label: 'Swimming Pool',
                              ),
                              FacilityIconItem(
                                icon: Icons.local_parking,
                                label: 'Parking Area',
                              ),
                              FacilityIconItem(
                                icon: Icons.hotel,
                                label: '4 Rooms',
                              ),
                              FacilityIconItem(
                                icon: Icons.wifi,
                                label: 'Wifi',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Hotel Service',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomBarPrice(context),
          ],
        ),
      ),
    );
  }

  Widget iconBackButton(IconData icon, VoidCallback onTap,
      {Color color = Colors.black}) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.8),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onTap,
      ),
    );
  }

  Widget BottomBarPrice(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Rp10.500',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                '/Night',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const CustomTextField(label: 'pilih'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price :',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  ),
                  const Text1(
                    text1: 'Rp480.00',
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tabColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Pay Now',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
