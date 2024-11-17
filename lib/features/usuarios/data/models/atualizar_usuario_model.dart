import 'package:campus_connect/features/usuarios/data/models/response_data_user_model.dart';

class AtualizarUsuarioModel {
  final String? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? idCurso;
  final ProfilePhoto? profilePhoto;
  final CoverPhoto? coverPhoto;
  final List<String>? roles;
  final List<String>? tokens;
  final CourseModel? course;

  AtualizarUsuarioModel({
    required this.id,
    this.uid,
    this.name,
    this.email,
    this.password,
    this.phone,
    required this.idCurso,
    this.profilePhoto,
    this.coverPhoto,
    this.roles,
    this.tokens,
    this.course,
  });

  factory AtualizarUsuarioModel.fromJson(Map<String, dynamic> json) {
    return AtualizarUsuarioModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      idCurso: json['id_curso'],
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhoto.fromJson(json['profilePhoto'])
          : null,
      coverPhoto: json['coverPhoto'] != null
          ? CoverPhoto.fromJson(json['coverPhoto'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      tokens: json['tokens'] != null ? List<String>.from(json['tokens']) : [],
      course: json['course'] != null ? CourseModel.fromJson(json['course']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'id_curso': idCurso,
      'profilePhoto': profilePhoto?.toJson(),
      'coverPhoto': coverPhoto?.toJson(),
      'roles': roles,
      'tokens': tokens,
      'course': course?.toJson(),
    };
  }
}