class UserProfileModel {
  String? name;
  String? email;

  UserProfileModel({
    this.name,
    this.email,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['data']['name'],
      email: json['data']['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
