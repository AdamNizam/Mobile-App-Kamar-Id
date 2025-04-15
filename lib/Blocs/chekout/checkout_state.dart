part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutFailed extends CheckoutState {
  final String error;

  const CheckoutFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class CheckoutSuccess extends CheckoutState {
  final ResultChekout data;

  const CheckoutSuccess(this.data);

  @override
  List<Object> get props => [data];
}
