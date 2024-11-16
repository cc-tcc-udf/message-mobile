// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuarioController on _UsuarioControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_UsuarioControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$cursosAtom =
      Atom(name: '_UsuarioControllerBase.cursos', context: context);

  @override
  ResponseListCoursesModel? get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(ResponseListCoursesModel? value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_UsuarioControllerBase.usuario', context: context);

  @override
  ResponseDataUserModel? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(ResponseDataUserModel? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$getListCoursesAsyncAction =
      AsyncAction('_UsuarioControllerBase.getListCourses', context: context);

  @override
  Future<void> getListCourses() {
    return _$getListCoursesAsyncAction.run(() => super.getListCourses());
  }

  late final _$getDataUserAsyncAction =
      AsyncAction('_UsuarioControllerBase.getDataUser', context: context);

  @override
  Future<void> getDataUser({required String email}) {
    return _$getDataUserAsyncAction.run(() => super.getDataUser(email: email));
  }

  late final _$atualizarAsyncAction =
      AsyncAction('_UsuarioControllerBase.atualizar', context: context);

  @override
  Future<void> atualizar(AtualizarUsuarioModel usuarios) {
    return _$atualizarAsyncAction.run(() => super.atualizar(usuarios));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
cursos: ${cursos},
usuario: ${usuario}
    ''';
  }
}
