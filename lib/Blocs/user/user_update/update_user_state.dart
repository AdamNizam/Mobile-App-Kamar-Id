part of 'update_user_bloc.dart';

sealed class UpdateUserState extends Equatable {
  const UpdateUserState();

  @override
  List<Object> get props => [];
}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserFailed extends UpdateUserState {
  final String error;

  const UpdateUserFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class UpdateUserSuccess extends UpdateUserState {
  final ResultUserUpdate data;

  const UpdateUserSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UpdatePasswordSuccess extends UpdateUserState {
  final ResultUpdatePassword data;

  const UpdatePasswordSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UpdateProfileSuccess extends UpdateUserState {
  final ResultImageProfile data;

  const UpdateProfileSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UploadImageLoading extends UpdateUserState {}
