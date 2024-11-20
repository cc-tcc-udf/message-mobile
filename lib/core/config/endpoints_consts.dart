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
  static String listaMensagens({required String id}) => '/private/msg/mobile/list/$id';
  static String detalheMensagem({required String id}) => '/private/msg/$id';
  //Files
  static const String envioFoto = '/public/file/create';
  static String updateFoto({required String id}) => '/private/file/$id/update';
}
