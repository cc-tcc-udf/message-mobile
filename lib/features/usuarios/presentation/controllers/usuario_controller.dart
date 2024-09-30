import 'package:campus_connect/features/usuarios/data/models/response_list_courses_model.dart';
import 'package:campus_connect/features/usuarios/domain/usecases/usuario_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/response_data_user_model.dart';

part 'usuario_controller.g.dart';

class UsuarioController = _UsuarioControllerBase
    with _$UsuarioController;

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


  @action
  Future<void> getListTypeDano() async {
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
  Future<void> getDataUser({required String email}) async {
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


}
