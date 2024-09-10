
class LoginModel {
  final String? email;
  final String? token;


  const LoginModel({
    required this.email,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        email: json['email'],
        token: json['token'],
    );
  }
}
