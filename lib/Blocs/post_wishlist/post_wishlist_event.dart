part of 'post_wishlist_bloc.dart';

sealed class PostWishlistEvent extends Equatable {
  const PostWishlistEvent();

  @override
  List<Object> get props => [];
}

class PostData extends PostWishlistEvent {
  final RequestWishlist dataRequest;

  const PostData(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
