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

class PostChekAvaibility extends HotelEvent {
  final int id;

  const PostChekAvaibility(this.id);
}
