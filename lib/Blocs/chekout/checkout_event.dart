part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

final class CheckoutSubmitEvent extends CheckoutEvent {
  final RequestChekout dataRequest;

  const CheckoutSubmitEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
