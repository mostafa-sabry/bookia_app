import 'package:bloc/bloc.dart';

import 'package:bookia_store/model/user_model.dart';
import 'package:bookia_store/model/user_profile_model.dart';
import 'package:bookia_store/repositories/user_repositories.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepositories) : super(UserInitial());

  final UserRepositories userRepositories;

  XFile? profilePic;

  UserModel? user;

  logIn({required String email, required String password}) async {
    emit(UserLogInLoading());
    final response = await userRepositories.logIn(
      email: email,
      password: password,
    );
    response.fold(
      (errMessage) => emit(UserLogInFailure(errorMessage: errMessage)),
      (userModel) => emit(UserLogInSuccess()),
    );
  }

  register({
    required String name,
    required String email,
    required String password,
    required String confirmationPassword,
  }) async {
    emit(UserRegisterLoading());
    final response = await userRepositories.signUp(
      name: name,
      email: email,
      password: password,
      confirmationPassword: confirmationPassword,
    );
    response.fold(
      (errMessage) => emit(UserRegisterFailure(errorMessage: errMessage)),
      (userModel) => emit(UserRegisterSuccess()),
    );
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UserUploadProfilePic());
  }

  getUserProfile() async {
    emit(GetUserLoading());
    try {
      final response = await userRepositories.getUserProfile();
      response.fold(
        (errMessage) => emit(GetUserFailure(errorMessage: errMessage)),
        (userProfileModel) => emit(GetUserSuccess(user: userProfileModel)),
      );
    } catch (e) {
      emit(GetUserFailure(errorMessage: 'An error occurred: ${e.toString()}'));
    }
  }
}
