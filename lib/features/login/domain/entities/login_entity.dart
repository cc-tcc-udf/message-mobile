import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? token;
  final String? email;

  const LoginEntity({
    this.email,
    this.token,
  });

  LoginEntity copyWith({
    String? token,
    String? email,
  }) =>
      LoginEntity(
        token: token ?? this.token,
        email: email ?? this.email,
      );

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      LoginEntity(
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'email': email,
    };
  }

  // TODO: implement props
  @override
  List<Object?> get props => [
        token,
        email,
      ];
}
