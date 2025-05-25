part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class FetchAllNotifications extends NotificationEvent {
  final String unreadRequest;
  final String readRequest;

  const FetchAllNotifications({
    required this.unreadRequest,
    required this.readRequest,
  });

  @override
  List<Object> get props => [unreadRequest, readRequest];
}

class GetUnreadNoticiation extends NotificationEvent {}
