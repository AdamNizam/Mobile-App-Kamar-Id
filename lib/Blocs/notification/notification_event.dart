part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class PostNotificationUnred extends NotificationEvent {
  final String dataRequest;

  const PostNotificationUnred(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}

class PostNotificationRead extends NotificationEvent {
  final String dataRequest;

  const PostNotificationRead(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
