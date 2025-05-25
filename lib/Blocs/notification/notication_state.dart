part of 'notication_bloc.dart';

sealed class NoticationState extends Equatable {
  const NoticationState();

  @override
  List<Object> get props => [];
}

final class NoticationInitial extends NoticationState {}

final class NoticationLoading extends NoticationState {}

final class NoticationFailed extends NoticationState {
  final String error;

  const NoticationFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class NoticationSuccess extends NoticationState {
  final ResultNotification data;

  const NoticationSuccess(this.data);

  @override
  List<Object> get props => [data];
}
