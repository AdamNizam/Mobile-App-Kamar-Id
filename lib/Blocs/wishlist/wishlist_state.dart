part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistFailed extends WishlistState {
  final String error;

  const WishlistFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class WishlistSuccess extends WishlistState {
  final List<Datum> wishlist;

  const WishlistSuccess(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}
