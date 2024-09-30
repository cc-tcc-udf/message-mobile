import 'package:campus_connect/features/usuarios/data/datasources/usuarios_datasource.dart';
import 'package:campus_connect/features/usuarios/data/models/response_list_courses_model.dart';

import '../models/response_data_user_model.dart';

abstract class UsuarioRepository {
  Future<ResponseListCoursesModel?> getListCursos();
  Future<ResponseDataUserModel?> getDataUser({required String email});
}

class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuariosDatasource datasource;

  UsuarioRepositoryImpl({required this.datasource});

  @override
  Future<ResponseListCoursesModel?> getListCursos() async {
    try {
      return await datasource.getListCursos();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseDataUserModel?> getDataUser({required String email}) async {
    try {
      return await datasource.getDadosUsuario(email: email);
    } catch (e) {
      rethrow;
    }
  }

}