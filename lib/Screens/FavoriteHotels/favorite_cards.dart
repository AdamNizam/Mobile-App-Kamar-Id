import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/WishlistModel/get_wishlist_model.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:hotelbookingapp/Widgets/text11.dart';

class FavoriteCard extends StatelessWidget {
  final ServiceWishlist data;

  const FavoriteCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
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
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/400/300',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 110,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.redAwesome,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Featured',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
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
                                Text(data.location?.name ?? 'No-data'),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                      3,
                                      (index) => const Icon(
                                            Icons.star,
                                            size: 20.0,
                                            color: AppColors.tabColor,
                                          )),
                                ),
                                const SizedBox(width: 4.0),
                                const Text('0.5'),
                              ],
                            ),
                            Row(
                              children: [
                                const Text11(
                                  text2: '10% Off',
                                  color: AppColors.tabColor,
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text1(
                                      text1: data.price,
                                      size: 18,
                                      color: AppColors.tabColor,
                                    ),
                                    const Text2(text2: '/night')
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 12,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 6,
                //   ),
                //   child: CustomButton(
                //     text: 'Booking Now',
                //     onTap: () {},
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widg

