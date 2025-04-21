part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserFailed extends UserState {
  final String error;

  const UserFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class UserSuccess extends UserState {
  final UserModel data;

  const UserSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UpdateUserSuccess extends UserState {
  final ResultUserUpdate data;

  const UpdateUserSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UpdatePasswordSuccess extends UserState {
  final ResultUpdatePassword data;

  const UpdatePasswordSuccess(this.data);

  @override
  List<Object> get props => [data];
}
