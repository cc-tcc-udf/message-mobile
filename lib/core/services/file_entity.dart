class FileEntity {
  final int? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? key;
  final String? uid;
  final int? idExt;

  FileEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.key,
    required this.uid,
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
      uid: json['uid'],
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
      'uid': uid,
      'id_ext': idExt,
    };
  }
}
