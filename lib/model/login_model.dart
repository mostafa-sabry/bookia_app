import 'package:bookia_store/core/api/end_point.dart';

class LoginModel {
  final String token;
  final String token_type;

  LoginModel({required this.token, required this.token_type});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json[ApiKey.token],
      token_type: json[ApiKey.tokenType],
    );
  }
}
