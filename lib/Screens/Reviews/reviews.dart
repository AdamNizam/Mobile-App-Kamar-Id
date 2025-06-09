import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Reviews/writereview.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/text1.dart';
import '../../Themes/colors.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                const Center(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      '4.7',
                      key: ValueKey('rating'),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow.shade800),
                        Icon(Icons.star, color: Colors.yellow.shade800),
                        Icon(Icons.star, color: Colors.yellow.shade800),
                        Icon(Icons.star, color: Colors.yellow.shade800),
                        Icon(Icons.star_half, color: Colors.yellow.shade800),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      'based on 85 Reviews',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                RatingRow(
                  text: 'Excellent',
                  width: 160,
                  color: Colors.green.withOpacity(0.9),
                ),
                RatingRow(
                  text: 'Good',
                  width: 140,
                  color: Colors.lightGreen.withOpacity(0.9),
                ),
                RatingRow(
                  text: 'Average',
                  width: 100,
                  color: Colors.orange.shade800,
                ),
                const RatingRow(
                  text: 'Below Average',
                  width: 70,
                  color: Colors.purple,
                ),
                const RatingRow(
                  text: 'Poor',
                  width: 40,
                  color: Colors.red,
                ),
                const SizedBox(height: 20),
                const ReviewContainer(
                  image: 'images/c5.png',
                  text1: 'John Smith',
                  text2: '4.6',
                  text3: '3 days ago',
                  reviewText:
                      'The hotel was fantastic! The room was clean and well-maintained.',
                ),
                const ReviewContainer(
                  image: 'images/c2.png',
                  text1: 'Jane Doe',
                  text2: '4.2',
                  text3: '7 days ago',
                  reviewText:
                      'Good stay overall. Minor issues with the room service, but the staff was friendly.',
                ),
                const ReviewContainer(
                  image: 'images/c3.png',
                  text1: 'Michael Johnson',
                  text2: '3.8',
                  text3: '2 weeks ago',
                  reviewText:
                      'Decent hotel but had some noise issues from the street.',
                ),
                const ReviewContainer(
                  image: 'images/c4.png',
                  text1: 'Emily Davis',
                  text2: '5.0',
                  text3: '1 month ago',
                  reviewText:
                      'Absolutely perfect! The amenities were top-notch and the view was amazing.',
                ),
                const ReviewContainer(
                  image: 'images/c5.png',
                  text1: 'William Brown',
                  text2: '2.5',
                  text3: '1 month ago',
                  reviewText:
                      'Not great. The room did not meet my expectations based on the photos.',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: CustomButton(
          text: 'Write A Review',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WriteReviews()),
            );
          },
        ),
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  final String image;
  final String text1, text2, text3, reviewText;
  const ReviewContainer({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFormFieldBorderColor),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text1: text1),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star,
                            color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star,
                            color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star,
                            color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star_half,
                            color: Colors.yellow.shade800, size: 15),
                        const SizedBox(width: 5),
                        Text1(text1: text2),
                        const Spacer(),
                        Text1(text1: text3),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text1(
            text1: reviewText,
            size: 14,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  const RatingRow({
    super.key,
    required this.text,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text1(
          text1: text,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Container(
            height: 8,
            width: double.infinity,
            color: Colors.white,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: width,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
