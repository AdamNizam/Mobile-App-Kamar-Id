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

final class PostWishlistSuccess extends WishlistState {
  final ResultWishlist data;

  const PostWishlistSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class GetWishlistSuccess extends WishlistState {
  final GetWishlistModel data;

  const GetWishlistSuccess(this.data);

  @override
  List<Object> get props => [data];
}
