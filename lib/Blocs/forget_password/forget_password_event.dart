part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

final class PostEmailForgetPassword extends ForgetPasswordEvent {
  final String emailRequest;

  const PostEmailForgetPassword(this.emailRequest);

  @override
  List<Object> get props => [emailRequest];
}
