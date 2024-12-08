class EnvioViewFavoriteModel {
  final String user;
  final String message;
  final bool favorite;
  final bool view;

  EnvioViewFavoriteModel({
    required this.user,
    required this.message,
    required this.favorite,
    required this.view
  });

  factory EnvioViewFavoriteModel.fromJson(Map<String, dynamic> json) {
    return EnvioViewFavoriteModel(
      user: json['user'] as String,
      message: json['message'] as String,
      favorite: json['favorite'] as bool,
      view: json['view'] as bool
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'message': message,
      'favorite': favorite,
      'view': view
    };
  }
}