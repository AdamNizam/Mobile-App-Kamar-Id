part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

final class CheckoutSubmitEvent extends CheckoutEvent {
  final CheckoutModel checkoutModel;

  const CheckoutSubmitEvent(this.checkoutModel);

  @override
  List<Object> get props => [checkoutModel];
}
