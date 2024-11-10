
class CadastroUsuarioModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final bool active;


  const CadastroUsuarioModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.active
  });

  factory CadastroUsuarioModel.fromJson(Map<String, dynamic> json) {
    return CadastroUsuarioModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      active: json['active']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'active': active
    };
  }
}
