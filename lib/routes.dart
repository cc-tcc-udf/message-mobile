import 'package:campus_connect/features/configuracoes/perfil_page.dart';
import 'package:campus_connect/features/configuracoes/tema_page.dart';
import 'package:campus_connect/features/configuracoes/termos_e_politica_page.dart';
import 'package:campus_connect/features/home/presentation/pages/home_page.dart';
import 'package:campus_connect/features/login/presentation/pages/cadastro_page.dart';
import 'package:campus_connect/features/login/presentation/pages/login_page.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/detalhe_mensagem_page.dart';
import 'package:campus_connect/features/usuarios/presentation/pages/escolher_curso_page.dart';
import 'package:flutter/material.dart';

class Routes {
  //Login
  static const String initial = '/home';

  //Home
  static const String cadastro = '/cadastro';
  static const String login = '/login';

  //Cursos
  static const String escolherCursos = '/escolherCursos';

  //Mensagem
  static const String detalheMensagem = '/detalheMensagem';

  //Configurações
  static const String perfil = '/perfil';
  static const String tema = '/tema';
  static const String termos = '/termos';



  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) =>
            const LoginPage());
      case Routes.cadastro:
        return MaterialPageRoute(
            builder: (_) =>
            const CadastroPage());
      case Routes.escolherCursos:
        return MaterialPageRoute(builder: (_) => const EscolherCursoPage());
      case Routes.perfil:
        return MaterialPageRoute(builder: (_) => const PerfilPage());
      case Routes.tema:
        return MaterialPageRoute(builder: (_) => const TemaPage());
      case Routes.termos:
        return MaterialPageRoute(builder: (_) => const TermosEPoliticaPage());
      case Routes.detalheMensagem:
        if (settings.arguments != null && settings.arguments is Map<String, dynamic>) {
          var args = settings.arguments as Map<String, dynamic>;
          String id = args['id'];
          return MaterialPageRoute(
            builder: (_) => DetalheMensagemPage(id: id),
          );
        }
      default:
        return null;
    }
    return null;
  }
}
