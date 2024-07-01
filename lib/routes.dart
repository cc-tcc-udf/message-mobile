import 'package:campus_connect/features/home/presentation/pages/home_page.dart';
import 'package:campus_connect/features/login/presentation/pages/cadastro_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/home': (_) => HomePage(),
    '/cadastro':(_) => const CadastroPage()
  };

  static String initial = '/home';
  static String cadastro = '/cadastro';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
