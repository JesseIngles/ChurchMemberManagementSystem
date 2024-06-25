class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
    );
  }
}

class User {
  String userName;
  String fotografia;
  String phoneNumber;

  User({
    required this.userName,
    required this.fotografia,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'] as String,
      fotografia: json['fotografia'] as String,
      phoneNumber: json['phonenumber'] as String,
    );
  }
}
