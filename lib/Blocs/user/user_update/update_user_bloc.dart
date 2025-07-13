import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/UserModel/form_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Models/UserModel/result_image_profile.dart';
import 'package:hotelbookingapp/Models/UserModel/result_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/result_user_update.dart';
import 'package:hotelbookingapp/Services/user_service.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  UpdateUserBloc() : super(UpdateUserInitial()) {
    on<UpdateUserEvent>((event, emit) async {
      if (event is PostDataUpdateEvent) {
        try {
          emit(UpdateUserLoading());

          final data = await UserService().updateProfile(event.dataRequest);

          emit(UpdateUserSuccess(data));
        } catch (error) {
          print('Error Update User: $error');
          emit(UpdateUserFailed(error.toString()));
        }
      }

      if (event is PostUpdatePasswordEvent) {
        try {
          emit(UpdateUserLoading());

          final data = await UserService().updatePassword(event.dataRequest);

          emit(UpdatePasswordSuccess(data));
        } catch (error) {
          print('Error Update password: $error');
          emit(UpdateUserFailed(error.toString()));
        }
      }

      if (event is UploadImageProfileEvent) {
        try {
          emit(UploadImageLoading());

          emit(
            UploadImageLoadingScccess(
              await UserService().uploadImageProfile(event.imageRequest),
            ),
          );
        } catch (error) {
          print('Error Upload Image: $error');
          emit(UploadImageFailed());
        }
      }
    });
  }
}
