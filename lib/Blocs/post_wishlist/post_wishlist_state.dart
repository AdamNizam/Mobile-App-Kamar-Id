part of 'post_wishlist_bloc.dart';

sealed class PostWishlistState extends Equatable {
  const PostWishlistState();

  @override
  List<Object> get props => [];
}

final class PostWishlistInitial extends PostWishlistState {}

final class PostWishlistLoading extends PostWishlistState {}

final class PostWishlistFailed extends PostWishlistState {
  final String error;

  const PostWishlistFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class PostWishlistSuccess extends PostWishlistState {
  final ResultWishlist data;

  const PostWishlistSuccess(this.data);

  @override
  List<Object> get props => [data];
}
