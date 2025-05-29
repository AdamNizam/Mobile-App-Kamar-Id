import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/get_wishlist/get_wishlist_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class FavoriteCard extends StatefulWidget {
  final ServiceWishlist data;

  const FavoriteCard({super.key, required this.data});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              showCustomSnackbar(context, 'fitur is not available');
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.beauBlue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                            tag: data.id,
                            child: Image.network(
                              data.image ?? 'https://picsum.photos/400/300',
                              fit: BoxFit.cover,
                              width: 120,
                              height: 128,
                            ),
                          ),
                        ),
                        // if (data.isFeatured == 1)
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.redAwesome,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: const Text1(
                              text1: 'Featured',
                              color: AppColors.white,
                              size: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.amberColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    1,
                                    (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                const Text2(
                                  text2: '0.0',
                                  fontWeight: FontWeight.bold,
                                  size: 10,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomTextOverflow(
                                    text: data.title,
                                    color: AppColors.black,
                                    size: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                BlocConsumer<PostWishlistBloc,
                                    PostWishlistState>(
                                  listener: (context, state) {
                                    context
                                        .read<GetWishlistBloc>()
                                        .add(GetData());
                                  },
                                  builder: (context, stateWishlist) {
                                    return GestureDetector(
                                      onTap: () {
                                        context.read<PostWishlistBloc>().add(
                                              PostData(
                                                RequestWishlist(
                                                  objectId: widget.data.id,
                                                ),
                                              ),
                                            );
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: AppColors.redAwesome,
                                        size: 22,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 18, color: AppColors.tabColor),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text1(
                                    text1: 'no location info',
                                    size: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const TextRemaining(
                              text: '12 Rooms Left',
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text1(
                                  text1: data.price,
                                  size: 16,
                                  color: AppColors.tabColor,
                                ),
                                const Text2(text2: '/night'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
