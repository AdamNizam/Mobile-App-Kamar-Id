import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/wishlist/wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/CustomWidgets/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/text11.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                              'https://picsum.photos/400/300?random=100',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 110,
                            ),
                          ),
                        ),
                        if (data.isFeatured == 1)
                          Positioned(
                            top: 6,
                            left: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.redAwesome,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Featured',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
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
                                BlocBuilder<WishlistBloc, WishlistState>(
                                  builder: (context, stateWishlist) {
                                    if (stateWishlist is WishlistLoading) {
                                      return LoadingAnimationWidget
                                          .staggeredDotsWave(
                                        color: AppColors.redAwesome,
                                        size: 22,
                                      );
                                    }
                                    if (stateWishlist is PostWishlistSuccess) {
                                      showCustomSnackbar(
                                          context, 'Delete favorite success');
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        context.read<WishlistBloc>().add(
                                              PostWishlistEvent(
                                                RequestWishlist(
                                                    objectId: widget.data.id),
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
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 18, color: AppColors.tabColor),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    data.location?.name ?? 'No location info',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: AppColors.cadetGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    3,
                                    (index) => const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: AppColors.tabColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text('0.5'),
                              ],
                            ),
                            const SizedBox(height: 6),
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
                                      size: 16,
                                      color: AppColors.tabColor,
                                    ),
                                    const Text2(text2: '/night'),
                                  ],
                                ),
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
