part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();
  
  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}
