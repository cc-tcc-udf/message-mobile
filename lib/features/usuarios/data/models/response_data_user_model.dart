class ResponseDataUserModel {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final int? idCurso;
  final ProfilePhoto? profilePhoto;
  final CoverPhoto? coverPhoto;
  final List<String>? roles;
  final List<String>? tokens;
  final Course? course;

  ResponseDataUserModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.idCurso,
    required this.profilePhoto,
    required this.coverPhoto,
    required this.roles,
    required this.tokens,
    required this.course,
  });

  factory ResponseDataUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataUserModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      idCurso: json['id_curso'],
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhoto.fromJson(json['profilePhoto'])
          : null,
      coverPhoto: json['coverPhoto'] != null
          ? CoverPhoto.fromJson(json['coverPhoto'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      tokens: json['tokens'] != null ? List<String>.from(json['tokens']) : [],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'id_curso': idCurso,
      'profilePhoto': profilePhoto?.toJson(),
      'coverPhoto': coverPhoto?.toJson(),
      'roles': roles,
      'tokens': tokens,
      'course': course?.toJson(),
    };
  }
}

class ProfilePhoto {
  final int? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? key;
  final String? uid;
  final int? idExt;

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
  final int? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? key;
  final String? uid;
  final int? idExt;

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
  final int? id;
  final String? name;
  final String? description;
  final String? abbreviation;
  final int? resp;
  final int? courseGroupId;
  final bool? isGroup;
  final List<Course>? courses;

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
      courses: (json['courses'] as List<dynamic>?)
          ?.map((course) => Course.fromJson(course))
          .toList() ?? [],
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
      'courses': courses?.map((course) => course.toJson()).toList(),
    };
  }
}
