import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/ResponseResult/result_check_avaibility.dart';
import 'package:hotelbookingapp/Services/hotel_service.dart';

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
            // emit(HotelFailed(error.toString()));
            emit(const HotelFailed('Terjandi Kesalahan'));
          }
        }

        if (event is GetDetailHotel) {
          try {
            emit(HotelDetailLoading());

            final data = await HotelService().getAllDetailHotel(event.slug);

            emit(GetAllHotelDetailSuccess(data));
          } catch (error) {
            // print('pesan error: $error');
            emit(const HotelFailed('Terjadi Kesalahan'));
          }
        }

        if (event is PostCheckAvailability) {
          try {
            emit(ChekAvaibilityLoading());

            final data = await HotelService().checkAvaibility(
              hotelId: event.hotelId,
              startDate: event.startDate,
              endDate: event.endDate,
              adults: event.adults,
              children: event.children,
            );

            emit(CheckAvaibilitySuccess(data));
          } catch (error) {
            // print('check availability error: $error');
            emit(const ChekAvaibilityFailed('Terjadi Kesalahan'));
          }
        }
      },
    );
  }
}
