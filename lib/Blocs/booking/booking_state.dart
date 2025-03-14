part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingHistoryLoading extends BookingState {}

final class BookingHistoryFailed extends BookingState {
  final String error;

  const BookingHistoryFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class BookingHistorySuccess extends BookingState {
  final List<Datum> bookingHistory;

  const BookingHistorySuccess(this.bookingHistory);

  @override
  List<Object> get props => [bookingHistory];
}
