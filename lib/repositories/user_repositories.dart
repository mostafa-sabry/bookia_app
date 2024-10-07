import 'package:bookia_store/cache/cache_helper.dart';
import 'package:bookia_store/core/api/api_service.dart';

import 'package:bookia_store/model/user_profile_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/user_model.dart';

class UserRepositories {
  Future<Either<String, UserModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService().post(
        url: 'https://api.codingarabic.online/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final user = UserModel.fromJson(response);
      CacheHelper().saveData(key: 'token', value: user.token);
      return Right(user);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmationPassword,
  }) async {
    try {
      final response = await ApiService().post(
        url: 'https://api.codingarabic.online/api/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmationPassword,
        },
      );
      final user = UserModel.fromJson(response);
      return Right(user);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, UserProfileModel>> getUserProfile() async {
    try {
      final response = await ApiService()
          .get(apiUrl: 'https://api.codingarabic.online/api/user');
      final userProfile = UserProfileModel.fromJson(response);
      return Right(userProfile);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
