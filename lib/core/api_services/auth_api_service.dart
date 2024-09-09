import 'package:bookia_store/models/login_user_model.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final String baseUrl = "https://api.codingarabic.online/api";
  Dio dio = Dio();

  login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/auth/login",
        data: {"email": email, "password": password},
      );
      dynamic jsonData = response.data;
      Map<String, dynamic> data = jsonData['data'];

      AuthModel loginUserModel = AuthModel.fromJson(data);
    } catch (e) {}
  }

  register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/auth/register",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "password_confirmation": passwordConfirm
        },
      );
      dynamic jsonData = response.data;
      // Map<String, dynamic> data = jsonData['data'];

      AuthModel authModel = AuthModel.fromJson(jsonData['data']);
    } catch (e) {}
  }
}
