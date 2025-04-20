import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Models/WishlistModel/result_wishlist.dart';
import 'package:hotelbookingapp/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/Services/wishlist_service.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) async {
      if (event is PostWishlistEvent) {
        try {
          emit(WishlistLoading());

          final data = await WishlistService().postWishList(event.dataRequest);

          emit(PostWishlistSuccess(data));
        } catch (error) {
          print('Error Post wishlist : $error');
          emit(const WishlistFailed('failed add to wishlist'));
        }
      }

      if (event is GetWishlistEvent) {
        try {
          emit(WishlistLoading());

          final data = await WishlistService().getWishList();

          emit(GetWishlistSuccess(data));
        } catch (error) {
          print('Error Get wishlist : $error');
          emit(const WishlistFailed('Take data is failed'));
        }
      }
    });
  }
}
