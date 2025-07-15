import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Data/Api/notification_service.dart';
import 'package:hotelbookingapp/Data/Models/NotificationModel/result_notification.dart';

part 'notication_event.dart';
part 'notication_state.dart';

class NoticationBloc extends Bloc<NoticationEvent, NoticationState> {
  NoticationBloc() : super(NoticationInitial()) {
    on<NoticationEvent>((event, emit) async {
      if (event is GetAllMessage) {
        try {
          emit(NoticationLoading());

          final unreadData =
              await NotificationService().loadNotify(event.typeUnred);
          final readData =
              await NotificationService().loadNotify(event.typeread);

          emit(NoticationSuccess(readData: readData, unreadData: unreadData));
        } catch (error) {
          emit(NoticationFailed(error.toString()));
        }
      }
      if (event is ReadMessage) {
        try {
          emit(NoticationLoading());

          final data = await NotificationService().readNotif(event.idNotif);

          print('Result notif $data');
        } catch (error) {
          emit(NoticationFailed(error.toString()));
        }
      }
    });
  }
}
