part of 'update_user_bloc.dart';

sealed class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();

  @override
  List<Object> get props => [];
}

class PostDataUpdateEvent extends UpdateUserEvent {
  final RequestUserUpdate dataRequest;

  const PostDataUpdateEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}

class PostUpdatePasswordEvent extends UpdateUserEvent {
  final FormUpdatePassword dataRequest;

  const PostUpdatePasswordEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}

class UploadImageProfileEvent extends UpdateUserEvent {
  final File imageRequest;

  const UploadImageProfileEvent(this.imageRequest);

  @override
  List<Object> get props => [imageRequest];
}
