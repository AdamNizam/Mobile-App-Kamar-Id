import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_detail_model.dart';
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

            final rowHotel = await HotelService().gethAllHotels();

            emit(HotelSuccess(rowHotel));
          } catch (error) {
            // emit(HotelFailed(error.toString()));
            emit(const HotelFailed('Terjandi Kesalahan'));
          }
        }

        if (event is GetDetailHotel) {
          try {
            emit(HotelDetailLoading());

            final allDetailHotel =
                await HotelService().getAllDetailHotel(event.slug);

            emit(GetAllHotelDetailSuccess(allDetailHotel));

            // final hotelDetail = await HotelService().getDetailHotel(event.slug);
            // emit(HotelDetailSuccess(hotelDetail));
          } catch (error) {
            emit(const HotelFailed('Terjadi Kesalahan'));
            print('pesan error: $error');
          }
        }
      },
    );
  }
}
