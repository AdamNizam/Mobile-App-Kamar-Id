import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Data/Api/hotel_service.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_detail_model.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>(
      (event, emit) async {
        if (event is GetAllHotels) {
          try {
            emit(HotelLoading());

            final data = await HotelService().gethAllHotels();

            emit(HotelSuccess(data));
          } catch (error) {
            debugPrint('Failed Get All Hotel : $error');
            emit(HotelFailed(error.toString()));
          }
        }

        if (event is GetDetailHotel) {
          try {
            emit(HotelDetailLoading());

            final data = await HotelService().getDetailHotel(event.slug);

            emit(GetAllHotelDetailSuccess(data));
          } catch (error) {
            debugPrint('Failed Get Detail Hotel: $error');
            emit(HotelFailed(error.toString()));
          }
        }
      },
    );
  }
}
