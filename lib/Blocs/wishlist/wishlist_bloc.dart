import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/wishlist_model.dart';
import 'package:hotelbookingapp/Services/wishlist_service.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) async {
      if (event is GetWishlist) {
        try {
          emit(WishlistLoading());

          final wishlist = await WishlistService().getWishList();

          emit(WishlistSuccess(wishlist));
        } catch (e) {
          emit(const WishlistFailed('Terjadi Kesalahan'));
          print('pesan kesalahan : $e');
        }
      }
    });
  }
}
