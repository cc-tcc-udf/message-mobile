
class ResponseCadastroUsuarioModel {
  final String? email;
  final String? token;


  const ResponseCadastroUsuarioModel({
    required this.email,
    required this.token,
  });

  factory ResponseCadastroUsuarioModel.fromJson(Map<String, dynamic> json) {
    return ResponseCadastroUsuarioModel(
      email: json['email'],
      token: json['token'],
    );
  }
}
