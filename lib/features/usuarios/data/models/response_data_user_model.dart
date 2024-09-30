class ResponseDataUserModel {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final List<String>? roles;

  ResponseDataUserModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
  });

  factory ResponseDataUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataUserModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      roles: List<String>.from(json['roles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'roles': roles,
    };
  }
}

class ProfilePhoto {
  final int id;
  final String name;
  final String type;
  final String url;
  final int size;
  final String key;
  final String uid;
  final int idExt;

  ProfilePhoto({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.key,
    required this.uid,
    required this.idExt,
  });

  factory ProfilePhoto.fromJson(Map<String, dynamic> json) {
    return ProfilePhoto(
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

class CoverPhoto {
  final int id;
  final String name;
  final String type;
  final String url;
  final int size;
  final String key;
  final String uid;
  final int idExt;

  CoverPhoto({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.key,
    required this.uid,
    required this.idExt,
  });

  factory CoverPhoto.fromJson(Map<String, dynamic> json) {
    return CoverPhoto(
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

class Course {
  final int id;
  final String name;
  final String description;
  final String abbreviation;
  final int resp;
  final int courseGroupId;
  final bool isGroup;
  final List<String> courses;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation,
    required this.resp,
    required this.courseGroupId,
    required this.isGroup,
    required this.courses,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      abbreviation: json['abbreviation'],
      resp: json['resp'],
      courseGroupId: json['courseGroupId'],
      isGroup: json['isGroup'],
      courses: List<String>.from(json['courses']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'abbreviation': abbreviation,
      'resp': resp,
      'courseGroupId': courseGroupId,
      'isGroup': isGroup,
      'courses': courses,
    };
  }
}
