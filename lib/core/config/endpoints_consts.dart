class EndPointsConsts {
  //Login
  static const String login = '/public/auth/login';
  //Cadastro
  static const String cadastro = '/public/auth/mobile/register';
  //Usuário
  static String dadosUsuario({required String email}) => '/private/auth/mobile/getUser?email=$email';
  static const String atualizarUsuario = '/private/auth/update';
  //Cursos
  static const String listaCursos = '/private/course/mobile/groups';
  //Mensagens
  static const String listaMensagens = '/public/msg/list';
  static String detalheMensagem({required String id}) => '/public/msg/$id';
  //Files
  static const String envioFoto = '/public/file/create';
}
