import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Services/notification_service.dart';

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
    });
  }
}
