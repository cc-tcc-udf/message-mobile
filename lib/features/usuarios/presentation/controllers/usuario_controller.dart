import 'package:campus_connect/core/services/file_entity.dart';
import 'package:campus_connect/features/usuarios/data/models/atualizar_usuario_model.dart';
import 'package:campus_connect/features/usuarios/data/models/response_list_courses_model.dart';
import 'package:campus_connect/features/usuarios/domain/usecases/usuario_usecase.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/localstorage/security_local_storage.dart';
import '../../../../core/localstorage/security_shared_preference.dart';
import '../../../../core/services/anexo_model.dart';
import '../../data/models/response_data_user_model.dart';

part 'usuario_controller.g.dart';

class UsuarioController = _UsuarioControllerBase with _$UsuarioController;

abstract class _UsuarioControllerBase with Store {
  final UsuarioUsecase usecase;

  _UsuarioControllerBase({
    required this.usecase,
  });

  @observable
  bool isLoading = true;

  @observable
  ResponseListCoursesModel? cursos;

  @observable
  ResponseDataUserModel? usuario;

  @observable
  FileEntity? arquivo;

  @action
  Future<void> getListCourses() async {
    isLoading = true;
    try {
      cursos = await usecase.getListCourses();
    } catch (e) {
      isLoading = false;
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<ResponseDataUserModel?> getUser() async {
    if (usuario?.id == null) {
      await getDataUser();
    }
    return usuario;
  }

  @action
  Future<void> getDataUser() async {
    final SecurityLocalStorage storage = SecuritySharedPreference();
    var email = await storage.read('email');
    isLoading = true;
    try {
      usuario = await usecase.getDataUser(email: email);
    } catch (e) {
      isLoading = false;
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> atualizar(AtualizarUsuarioModel usuarios) async {
    isLoading = true;
    try {
      usuario = await usecase.atualizar(usuarios);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<FileEntity?> envioAnexo(AnexoModel anexo) async {
    try {
      isLoading = true;
      arquivo = await usecase.envioArquivo(file: anexo);
      return arquivo;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<FileEntity?> updateAnexo(AnexoModel anexo, String id) async {
    try {
      isLoading = true;
      arquivo = await usecase.updateArquivo(file: anexo, id: id);
      return arquivo;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
