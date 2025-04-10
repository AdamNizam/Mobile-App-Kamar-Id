part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentEvent extends Equatable {
  const MidtransPaymentEvent();

  @override
  List<Object> get props => [];
}

class PayNowPressed extends MidtransPaymentEvent {
  final String selectedType;
  final String selectedBank;
  final int totalPrice;

  const PayNowPressed({
    required this.selectedType,
    required this.totalPrice,
    required this.selectedBank,
  });

  @override
  List<Object> get props => [selectedType, selectedBank, totalPrice];
}
