class FileEntity {
  final String? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? key;
  final String? idExt;

  FileEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.key, d,
    required this.idExt,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) {
    return FileEntity(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      size: json['size'],
      key: json['key'],
      idExt: json['id_ext'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
      'size': size,
      'key': key,
      'id_ext': idExt,
    };
  }
}
