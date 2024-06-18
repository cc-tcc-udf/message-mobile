// ignore_for_file: non_constant_identifier_names

class Auth {
  final String access_token;

  const Auth({required this.access_token});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      access_token: json['access_token'],
    );
  }
}
