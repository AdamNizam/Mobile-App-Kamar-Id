import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class WishlistWidget extends StatefulWidget {
  final int idHotel;
  const WishlistWidget({super.key, required this.idHotel});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  bool checkWishlist = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostWishlistBloc, PostWishlistState>(
      listener: (context, state) {
        if (state is PostWishlistFailed) {
          showCustomSnackbar(context, state.error);
        }
        if (state is PostWishlistSuccess) {
          setState(() {
            checkWishlist = true;
          });
          showCustomSnackbar(context, "Berhasil ditambahkan ke wishlist");
        }
      },
      child: GestureDetector(
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
          checkWishlist ? Icons.favorite : Icons.favorite_border,
          color: AppColors.redAwesome,
          size: 22,
        ),
      ),
    );
  }
}
