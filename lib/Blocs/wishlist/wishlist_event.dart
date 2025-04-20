part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class GetWishlistEvent extends WishlistEvent {}

class PostWishlistEvent extends WishlistEvent {
  final RequestWishlist dataRequest;

  const PostWishlistEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
