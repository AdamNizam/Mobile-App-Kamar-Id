part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class GetWishlistEvent extends WishlistEvent {}

class PostWishlistEvent extends WishlistEvent {
  final RequestWishlistModel data;

  const PostWishlistEvent(this.data);

  @override
  List<Object> get props => [data];
}
