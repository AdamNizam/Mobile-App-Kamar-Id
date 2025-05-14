import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/wishlist/wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Screens/WishlistHotel/favorite_cards.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteHotels extends StatefulWidget {
  const FavoriteHotels({super.key});

  @override
  FavoriteHotelsState createState() => FavoriteHotelsState();
}

class FavoriteHotelsState extends State<FavoriteHotels>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int totalWishlist = 0;

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
    return BlocProvider(
      create: (context) => WishlistBloc()..add(GetWishlistEvent()),
      child: BlocConsumer<WishlistBloc, WishlistState>(
        listener: (context, state) {
          if (state is WishlistFailed) {
            showCustomSnackbar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is GetWishlistSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  totalWishlist = state.data.total;
                });
              }
            });
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const CustomAppTopBar(
              title: 'Wishlist Hotel',
              icon: Icons.favorite_border,
              iconColor: AppColors.redAwesome,
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                child: (state is GetWishlistSuccess)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              child: state.data.dataWishlist.isEmpty
                                  ? Center(
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'images/empty_wishlisht.svg',
                                            height: 200,
                                          ),
                                          Text(
                                            "No favorites added.",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.cadetGray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: state.data.dataWishlist
                                          .map((wishlist) {
                                        return FavoriteCard(
                                          data: wishlist.service,
                                        );
                                      }).toList(),
                                    ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: List.generate(
                          4,
                          (_) => shimmerListTile(),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget shimmerListTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
