part of 'hotel_bloc.dart';

sealed class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetAllHotels extends HotelEvent {}

class GetDetailHotel extends HotelEvent {
  final String slug;

  const GetDetailHotel(this.slug);
}

class PostCheckAvailability extends HotelEvent {
  final int hotelId;
  final DateTime startDate;
  final DateTime endDate;
  final int adults;
  final int? children;

  const PostCheckAvailability({
    required this.hotelId,
    required this.startDate,
    required this.endDate,
    required this.adults,
    this.children,
  });
}
