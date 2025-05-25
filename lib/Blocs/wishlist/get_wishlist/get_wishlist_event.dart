part of 'get_wishlist_bloc.dart';

sealed class GetWishlistEvent extends Equatable {
  const GetWishlistEvent();

  @override
  List<Object> get props => [];
}

class GetData extends GetWishlistEvent {}

class WishlistRiset extends GetWishlistEvent {}
