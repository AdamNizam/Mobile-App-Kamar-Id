import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';

part 'notication_event.dart';
part 'notication_state.dart';

class NoticationBloc extends Bloc<NoticationEvent, NoticationState> {
  NoticationBloc() : super(NoticationInitial()) {
    on<NoticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
