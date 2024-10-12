class EndPointsConsts {
  //Login
  static const String login = '/public/auth/login';
  //Cadastro
  static const String cadastro = '/public/auth/register';
  //Usuário
  static String dadosUsuario({required String email}) => '/private/auth/getUser?email=$email';
  static const String atualizarUsuario = '/private/auth/update';
  //Cursos
  static const String listaCursos = '/public/course/groups';
  //Mensagens
  static const String listaMensagens = '/public/msg/list';

}
