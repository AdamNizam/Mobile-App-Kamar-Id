part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfile extends UserEvent {}

class PostUserUpdateEvent extends UserEvent {
  final RequestUserUpdate dataRequest;

  const PostUserUpdateEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
