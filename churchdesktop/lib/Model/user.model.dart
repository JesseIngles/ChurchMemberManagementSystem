class User {
  final String id;
  final String fotografia;
  final String userName;
  final String password;
  final String phonenumber;

  User({
    required this.id,
    required this.fotografia,
    required this.userName,
    required this.password,
    required this.phonenumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fotografia: json['fotografia'],
      userName: json['userName'],
      password: json['password'],
      phonenumber: json['phonenumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fotografia': fotografia,
      'userName': userName,
      'password': password,
      'phonenumber': phonenumber,
    };
  }
}
