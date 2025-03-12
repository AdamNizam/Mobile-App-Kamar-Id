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
  final DataProfile userProfile;

  const UserSuccess(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}
