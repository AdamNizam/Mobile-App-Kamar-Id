part of 'get_wishlist_bloc.dart';

sealed class GetWishlistState extends Equatable {
  const GetWishlistState();

  @override
  List<Object> get props => [];
}

final class GetWishlistInitial extends GetWishlistState {}

final class GetWishlistLoading extends GetWishlistState {}

final class GetWishlistFailed extends GetWishlistState {
  final String error;

  const GetWishlistFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class GetWishlistSuccess extends GetWishlistState {
  final GetWishlistModel data;

  const GetWishlistSuccess(this.data);

  @override
  List<Object> get props => [data];
}
