part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationFailed extends NotificationState {
  final String error;

  const NotificationFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class NotificationSuccess extends NotificationState {
  final ResultNotification unreadData;
  final ResultNotification readData;

  const NotificationSuccess(this.unreadData, this.readData);

  @override
  List<Object> get props => [unreadData, readData];
}
