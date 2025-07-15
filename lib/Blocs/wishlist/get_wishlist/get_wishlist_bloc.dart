import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/Data/Api/Services/wishlist_service.dart';

part 'get_wishlist_event.dart';
part 'get_wishlist_state.dart';

class GetWishlistBloc extends Bloc<GetWishlistEvent, GetWishlistState> {
  GetWishlistBloc() : super(GetWishlistInitial()) {
    on<GetWishlistEvent>((event, emit) async {
      if (event is GetData) {
        try {
          emit(GetWishlistLoading());

          final data = await WishlistService().getWishList();

          emit(GetWishlistSuccess(data));
        } catch (error) {
          print('Error Get wishlist : $error');
          emit(const GetWishlistFailed('Take data is failed'));
        }
      }
    });
  }
}
