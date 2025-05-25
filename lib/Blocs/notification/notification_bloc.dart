import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Services/notification_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetUnreadNoticiation) {
        try {
          emit(NotificationLoading());

          final data = await NotificationService().loadNotify();

          emit(NotificationSuccess(data));
        } catch (error) {
          emit(NotificationFailed(error.toString()));
        }
      }
    });
  }
}
