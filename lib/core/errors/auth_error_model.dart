class AuthErrorModel {
  final String message;
  final User user;

  AuthErrorModel({required this.message, required this.user});

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) {
    return AuthErrorModel(
        message: json['message'], user: User.fromJson(json['email']));
  }
}

class User {
  List<String>? email;

  User({this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
