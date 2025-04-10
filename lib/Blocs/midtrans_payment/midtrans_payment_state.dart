part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentState extends Equatable {
  const MidtransPaymentState();

  @override
  List<Object> get props => [];
}

final class MidtransPaymentInitial extends MidtransPaymentState {}

class MidtransPaymentLoading extends MidtransPaymentState {}

class MidtransPaymentSucsess extends MidtransPaymentState {
  final Map<String, dynamic> result;

  const MidtransPaymentSucsess(this.result);

  @override
  List<Object> get props => [result];
}

class MidtransPaymentFailed extends MidtransPaymentState {
  final String error;

  const MidtransPaymentFailed(this.error);

  @override
  List<Object> get props => [error];
}
