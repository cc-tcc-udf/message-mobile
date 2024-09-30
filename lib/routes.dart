import 'package:campus_connect/features/home/presentation/pages/home_page.dart';
import 'package:campus_connect/features/login/presentation/pages/cadastro_page.dart';
import 'package:campus_connect/features/usuarios/presentation/pages/escolher_curso_page.dart';
import 'package:flutter/material.dart';

class Routes {
  //Login
  static const String initial = '/home';

  //Home
  static const String cadastro = '/cadastro';

  //Cursos
  static const String escolherCursos = '/escolherCursos';


  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.cadastro:
        return MaterialPageRoute(
            builder: (_) =>
            const CadastroPage());
      case Routes.escolherCursos:
        return MaterialPageRoute(builder: (_) => const EscolherCursoPage());
      default:
        return null;
    }
  }
}
