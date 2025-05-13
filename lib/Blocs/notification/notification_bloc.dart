import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Services/notification_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is PostNotificationUnred) {
        try {
          emit(NotificationLoading());

          final data =
              await NotificationService().loadNotify(event.dataRequest);

          emit(NotificationSuccess(data));
        } catch (error) {
          print('Notication Unred error : $error');
          emit(const NotificationFailed('Notification Failed!'));
        }
      }

      if (event is PostNotificationRead) {
        try {
          emit(NotificationLoading());

          final data =
              await NotificationService().loadNotify(event.dataRequest);

          emit(NotificationSuccess(data));
        } catch (error) {
          print('Notication Unred error : $error');
          emit(const NotificationFailed('Notification Failed!'));
        }
      }
    });
  }
}
