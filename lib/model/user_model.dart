class UserModel {
  String? token;
  String? tokenType;

  UserModel({this.token, this.tokenType});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json['token'] ?? '',
        tokenType: json['token_type'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'token_type': tokenType,
      };
}
