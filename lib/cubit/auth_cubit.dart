import 'package:bloc/bloc.dart';
import 'package:bookia_store/core/api/api_service.dart';
import 'package:bookia_store/core/api/end_point.dart';
import 'package:bookia_store/core/errors/exception.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final ApiService api;

// loging from key
  GlobalKey<FormState> loginFormKey = GlobalKey();

  // loging  in email
  TextEditingController emailController = TextEditingController();
  // log in password
  TextEditingController passwordController = TextEditingController();

  // register from key
  GlobalKey<FormState> registerFormKey = GlobalKey();
  // register user name
  TextEditingController registerUserName = TextEditingController();
  // register email
  TextEditingController registerEmail = TextEditingController();
  // register password
  TextEditingController registerPassword = TextEditingController();
  // confirm password
  TextEditingController cofirmPassword = TextEditingController();

  login() async {
    try {
      emit(LoginLoading());
      final response = await api.post(
        EndPoint.logIn,
        data: {
          ApiKey.email: emailController.text,
          ApiKey.password: passwordController,
        },
      );
      emit(LogInSuccess());
    } on serverException catch (e) {
      emit(LoginError(errorMessage: e.errorModel.message));
    }
  }
}
