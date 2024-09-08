class AuthModel {
  final String token;
  final String tokenType;

  AuthModel({
    required this.token,
    required this.tokenType,
  });

  factory AuthModel.fromJson(Map<String,dynamic> jsonData){
    return AuthModel(token: jsonData['token'], tokenType: jsonData['token_type']);
  }
}
