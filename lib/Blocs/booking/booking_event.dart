part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class GetBookingHistory extends BookingEvent {}

class AddToCartEvent extends BookingEvent {
  final AddToCartModel cartModel;

  const AddToCartEvent(this.cartModel);

  @override
  List<Object> get props => [cartModel];
}
