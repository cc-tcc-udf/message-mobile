import 'package:campus_connect/features/usuarios/data/models/atualizar_usuario_model.dart';
import 'package:campus_connect/features/usuarios/data/models/response_list_courses_model.dart';
import 'package:campus_connect/features/usuarios/data/repositories/usuario_repository.dart';

import '../../../../core/services/anexo_model.dart';
import '../../../../core/services/file_entity.dart';
import '../../../login/data/models/response_cadastro_usuario_model.dart';
import '../../data/models/response_data_user_model.dart';

abstract class UsuarioUsecase {
  Future<ResponseListCoursesModel?>? getListCourses();
  Future<ResponseDataUserModel?>? getDataUser({required String email});
  Future<ResponseDataUserModel?> atualizar(
      AtualizarUsuarioModel usuario);
  Future<FileEntity> envioArquivo({required AnexoModel file});
  Future<FileEntity> updateArquivo(
      {required AnexoModel file, required int id});
}

class UsuarioUsecaseImpl implements UsuarioUsecase {
  final UsuarioRepository repository;

  UsuarioUsecaseImpl({required this.repository});

  @override
  Future<ResponseListCoursesModel?>? getListCourses() async {
    try {
      return await repository.getListCursos();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseDataUserModel?>? getDataUser({required String email}) async {
    try {
      return await repository.getDataUser(email: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FileEntity> envioArquivo(
      {required AnexoModel file}) async {
    try {
      var arquivo = await repository.envioArquivo(file: file);
      return arquivo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FileEntity> updateArquivo(
      {required AnexoModel file, required int id}) async {
    try {
      var arquivo = await repository.updateArquivo(file: file, id: id);
      return arquivo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseDataUserModel?> atualizar(
      AtualizarUsuarioModel usuario) async {
    try {
      return await repository.atualizar(usuario);
    } catch (e) {
      return Future.error(e);
    }
  }

}
