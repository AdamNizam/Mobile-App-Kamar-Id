import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CommonWidgets/galleryimages_widget.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:video_player/video_player.dart';

import '../../Constants/colors.dart';
import '../Booking/book_hotel.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({
    super.key,
    this.slug = '',
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  String selectedImage = 'images/LuxuryHotels.jpg';
  bool isVideoPlaying = true;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi video
    _videoController = VideoPlayerController.asset('assets/videos/hotel.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _videoController.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Gambar utama
              Stack(
                children: [
                  Image.asset(
                    selectedImage,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Galeri gambar kecil
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GalleryImage(
                                  imagePath: 'images/WaterfrontHotels.jpg',
                                  isSelected: selectedImage ==
                                      'images/WaterfrontHotels.jpg',
                                  onTap: () {
                                    setState(() {
                                      selectedImage =
                                          'images/WaterfrontHotels.jpg';
                                    });
                                  }),
                              GalleryImage(
                                  imagePath: 'images/Eco-FriendlyHotels.jpg',
                                  isSelected: selectedImage ==
                                      'images/Eco-FriendlyHotels.jpg',
                                  onTap: () {
                                    setState(() {
                                      selectedImage =
                                          'images/Eco-FriendlyHotels.jpg';
                                    });
                                  }),
                              GalleryImage(
                                  imagePath: 'images/AdventureHotels.jpg',
                                  isSelected: selectedImage ==
                                      'images/AdventureHotels.jpg',
                                  onTap: () {
                                    setState(() {
                                      selectedImage =
                                          'images/AdventureHotels.jpg';
                                    });
                                  }),
                            ]),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text1(
                              text1: 'Nama Hotel',
                              size: 17,
                            ),
                            Icon(Icons.favorite_border,
                                color: Colors.red, size: 30),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 20, color: AppColors.tabColor),
                            SizedBox(width: 8),
                            Text2(
                              text2: 'Paris, France',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Rating dan Harga
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.readOnly(
                              initialRating: 4.8,
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              filledColor: AppColors.tabColor,
                              size: 28,
                            ),
                            Text(
                              '\$150.00/night',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.buttonColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Deskripsi hotel
                        const Text1(
                          text1: 'Hotel Description',
                          size: 17,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Enjoy an unforgettable stay at our luxury hotel, located in the heart of Paris. Our resort offers world-class amenities, including a rooftop pool, fine dining, and spacious rooms with stunning city views. Whether traveling for business or leisure, our hotel is the perfect destination.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Fasilitas utama
                        const Text(
                          'Key Amenities:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• Rooftop Pool\n'
                          '• Fine Dining Restaurant\n'
                          '• Spa & Wellness Center\n'
                          '• Free Wi-Fi\n'
                          '• 24/7 Room Service',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 100), // Spacer untuk tombol
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Tombol booking di bagian bawah
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: CustomButton(
              text: 'Booking Now',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BookHotelScreen(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
