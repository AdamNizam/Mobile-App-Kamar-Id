part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentEvent extends Equatable {
  const MidtransPaymentEvent();

  @override
  List<Object> get props => [];
}

class PayNowPressed extends MidtransPaymentEvent {
  final int totalPrice;
  final String selectedType;
  final String customerEmail;
  final String? selectedBank;

  const PayNowPressed({
    required this.totalPrice,
    required this.selectedType,
    required this.customerEmail,
    this.selectedBank,
  });

  @override
  List<Object> get props => [
        totalPrice,
        selectedType,
        customerEmail,
        selectedBank ?? '',
      ];
}
