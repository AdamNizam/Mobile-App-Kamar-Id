import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingapp/Blocs/wishlist/get_wishlist/get_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/Screens/WishlistHotel/favorite_cards.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class FavoriteHotels extends StatefulWidget {
  final VoidCallback? onBack;

  const FavoriteHotels({super.key, this.onBack});

  @override
  FavoriteHotelsState createState() => FavoriteHotelsState();
}

class FavoriteHotelsState extends State<FavoriteHotels>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppTopBar(
        title: 'Wishlist Hotel',
        icon: Icons.favorite_border,
        onPop: () {
          if (widget.onBack != null) {
            widget.onBack!();
          }
        },
        onTap: () {
          showCustomSnackbar(context, 'fitur is not avaibale');
        },
      ),
      body: BlocBuilder<GetWishlistBloc, GetWishlistState>(
          builder: (context, state) {
        if (state is GetWishlistFailed) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomSnackbar(context, state.error);
          });
        }

        if (state is GetWishlistLoading) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const ShimmerList(),
            ),
          );
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
            child: (state is GetWishlistSuccess)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: state.data.dataWishlist.isNotEmpty
                              ? Column(
                                  children:
                                      state.data.dataWishlist.map((wishlist) {
                                    return FavoriteCard(
                                      data: wishlist.service,
                                    );
                                  }).toList(),
                                )
                              : Center(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'images/empty_wishlisht.svg',
                                        height: 200,
                                      ),
                                      const CustomTextEllipsis(
                                        text: "No favorites added.",
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cadetGray,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        );
      }),
    );
  }
}
