import 'package:bookia_store/models/login_user_model.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final String baseUrl = "https://api.codingarabic.online/api";
  Dio dio = Dio();

  postData({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/auth/login",
        data: {"email": email, "password": password},
      );
      Map<String, dynamic> jsonData = response.data;
      Map<String, dynamic> data = jsonData['data'];

      AuthModel loginUserModel =
          AuthModel(token: data['token'], tokenType: data['token_type']);
    } on Exception catch (e) {
      print(e);
    }
  }
}
