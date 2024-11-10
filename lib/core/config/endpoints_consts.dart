class EndPointsConsts {
  //Login
  static const String login = '/public/auth/login';
  //Cadastro
  static const String cadastro = '/public/auth/register?isMobile=true';
  //Usuário
  static String dadosUsuario({required String email}) => '/private/auth/getUser?email=$email';
  static const String atualizarUsuario = '/private/auth/update';
  //Cursos
  static const String listaCursos = '/public/course/groups?isGroup=true';
  //Mensagens
  static const String listaMensagens = '/public/msg/list';
  static String detalheMensagem({required int id}) => '/public/msg/$id';
  //Files
  static const String envioFoto = '/public/file/create';

}
