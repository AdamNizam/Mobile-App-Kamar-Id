part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentEvent extends Equatable {
  const MidtransPaymentEvent();

  @override
  List<Object> get props => [];
}

class PayNowPressed extends MidtransPaymentEvent {
  final MidtransModel midtransModel;

  const PayNowPressed(this.midtransModel);

  @override
  List<Object> get props => [midtransModel];
}
