part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentEvent extends Equatable {
  const MidtransPaymentEvent();

  @override
  List<Object> get props => [];
}

class PayWithMidtrans extends MidtransPaymentEvent {
  final MidtransModel dataRequest;

  const PayWithMidtrans(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
