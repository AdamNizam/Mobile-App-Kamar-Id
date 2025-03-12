part of 'booking_history_bloc.dart';

sealed class BookingHistoryState extends Equatable {
  const BookingHistoryState();

  @override
  List<Object> get props => [];
}

final class BookingHistoryInitial extends BookingHistoryState {}

final class BookingHistoryLoading extends BookingHistoryState {}

final class BookingHistoryFailed extends BookingHistoryState {
  final String error;

  const BookingHistoryFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class BookingHistorySuccess extends BookingHistoryState {
  final List<BookingHistoryModel> bookingHistory;

  const BookingHistorySuccess(this.bookingHistory);

  @override
  List<Object> get props => [bookingHistory];
}
