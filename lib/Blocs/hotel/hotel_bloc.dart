import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/hotel/result_check_avaibility_model.dart';
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

        if (event is PostChekAvaibility) {
          try {
            emit(ChekAvaibilityLoading());

            final data = await HotelService().checkAvaibility(event.id);

            emit(CheckAvaibilitySuccess(data));
          } catch (error) {
            print('chek avaibility : $error');
            emit(const ChekAvaibilityFailed('Terjadi Kesalahan'));
          }
        }
      },
    );
  }
}
