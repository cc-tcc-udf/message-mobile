class IndexModel {
  final String? message;
  final bool success;
  final Data? data;

  IndexModel({
    required this.message,
    required this.success,
    required this.data,
  });

  factory IndexModel.fromJson(Map<String, dynamic> json) {
    return IndexModel(
      message: json['message'] as String,
      success: json['success'] as bool,
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data!.toJson(),
    };
  }
}

class Data {
  final String? id;
  final String? email;
  final int? total;
  final int? favorites;
  final int? reads;
  final int? notReads;

  Data({
    required this.id,
    required this.email,
    required this.total,
    required this.favorites,
    required this.reads,
    required this.notReads,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as String,
      email: json['email'] as String,
      total: json['total'] as int,
      favorites: json['favorites'] as int,
      reads: json['reads'] as int,
      notReads: json['notReads'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'total': total,
      'favorites': favorites,
      'reads': reads,
      'notReads': notReads,
    };
  }
}
