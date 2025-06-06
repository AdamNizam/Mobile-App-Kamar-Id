import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_filter_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/result_filter_model.dart';
import 'package:hotelbookingapp/Services/hotel_service.dart';

part 'filter_hotel_event.dart';
part 'filter_hotel_state.dart';

class FilterHotelBloc extends Bloc<FilterHotelEvent, FilterHotelState> {
  FilterHotelBloc() : super(FilterHotelInitial()) {
    on<FilterHotelEvent>((event, emit) async {
      if (event is PostFilterHotel) {
        try {
          emit(FilterHotelLoading());
          final data = await HotelService().filterHotel(event.dataRequest);
          emit(FilterHotelSuccess(data));
        } catch (error) {
          debugPrint('Hotel filter error: $error');
          emit(FilterHotelFailed(error.toString()));
        }
      }
    });
  }
}
