import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Services/notification_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<FetchAllNotifications>((event, emit) async {
      try {
        emit(NotificationLoading());

        final unreadData =
            await NotificationService().loadNotify(event.unreadRequest);
        final readData =
            await NotificationService().loadNotify(event.readRequest);

        emit(NotificationSuccess(unreadData, readData));
      } catch (error) {
        print('Notification fetch error: $error');
        emit(const NotificationFailed('Notification Failed!'));
      }
    });
  }
}
