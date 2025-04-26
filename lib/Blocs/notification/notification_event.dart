part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class PostNotication extends NotificationEvent {
  final String dataRequest;

  const PostNotication(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
