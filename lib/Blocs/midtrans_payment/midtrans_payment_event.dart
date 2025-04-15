part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentEvent extends Equatable {
  const MidtransPaymentEvent();

  @override
  List<Object> get props => [];
}

class PayWithMidtrans extends MidtransPaymentEvent {
  final MidtransModel midtransModel;

  const PayWithMidtrans(this.midtransModel);

  @override
  List<Object> get props => [midtransModel];
}
