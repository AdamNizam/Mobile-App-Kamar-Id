part of 'update_user_bloc.dart';

sealed class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();

  @override
  List<Object> get props => [];
}

class PostUserUpdateEvent extends UpdateUserEvent {
  final RequestUserUpdate dataRequest;

  const PostUserUpdateEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}

class PostUpdatePasswordEvent extends UpdateUserEvent {
  final FormUpdatePassword dataRequest;

  const PostUpdatePasswordEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
