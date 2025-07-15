import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/result_wishlist.dart';
import 'package:hotelbookingapp/Data/Api/Services/wishlist_service.dart';

part 'post_wishlist_event.dart';
part 'post_wishlist_state.dart';

class PostWishlistBloc extends Bloc<PostWishlistEvent, PostWishlistState> {
  PostWishlistBloc() : super(PostWishlistInitial()) {
    on<PostWishlistEvent>((event, emit) async {
      if (event is PostData) {
        try {
          emit(PostWishlistLoading());

          final data = await WishlistService().postWishList(event.dataRequest);

          emit(PostWishlistSuccess(data));
        } catch (error) {
          print('Error Post wishlist : $error');
          emit(const PostWishlistFailed('Failed add to wishlist'));
        }
      }
    });
  }
}
