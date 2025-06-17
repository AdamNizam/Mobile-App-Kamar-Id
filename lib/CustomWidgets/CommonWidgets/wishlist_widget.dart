import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WishlistWidget extends StatefulWidget {
  final int idHotel;
  final IconData icon;
  const WishlistWidget({
    super.key,
    required this.idHotel,
    required this.icon,
  });

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostWishlistBloc(),
      child: BlocBuilder<PostWishlistBloc, PostWishlistState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state is PostWishlistFailed) {
              showCustomSnackbar(context, state.error);
            }
            if (state is PostWishlistSuccess) {
              showCustomSnackbar(context, "Success");
            }
          });
          if (state is PostWishlistLoading) {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.redAwesome,
                size: 20,
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              context.read<PostWishlistBloc>().add(
                    PostData(
                      RequestWishlist(
                        objectId: widget.idHotel,
                      ),
                    ),
                  );
            },
            child: Icon(
              widget.icon,
              color: AppColors.redAwesome,
              size: 22,
            ),
          );
        },
      ),
    );
  }
}
