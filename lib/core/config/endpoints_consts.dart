class EndPointsConsts {
  static const String login = '/public/auth/login';
  static const String cadastro = '/public/auth/register';
  static String dadosUsuario({required String email}) => '/private/auth/getUser?email=$email';
  static const String listaCursos = '/public/course/groups';

}
