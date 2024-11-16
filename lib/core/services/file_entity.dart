class FileEntity {
  final int? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? uid;

  FileEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.uid,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) {
    return FileEntity(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      size: json['size'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
      'size': size,
      'uid': uid,
    };
  }
}
