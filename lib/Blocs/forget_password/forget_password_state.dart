part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailed extends ForgetPasswordState {
  final String error;

  const ForgetPasswordFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final Map<String, dynamic> dataRequest;

  const ForgetPasswordSuccess(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
