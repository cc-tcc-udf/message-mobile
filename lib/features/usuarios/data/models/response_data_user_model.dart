class ResponseDataUserModel {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final ProfilePhoto? profilePhoto;
  final CoverPhoto? coverPhoto;
  final List<String>? roles;
  final Course? course;
  final bool? active;

  ResponseDataUserModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePhoto,
    required this.coverPhoto,
    required this.roles,
    required this.course,
    required this.active,
  });

  factory ResponseDataUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataUserModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhoto.fromJson(json['profilePhoto'])
          : null,
      coverPhoto: json['coverPhoto'] != null
          ? CoverPhoto.fromJson(json['coverPhoto'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePhoto': profilePhoto?.toJson(),
      'coverPhoto': coverPhoto?.toJson(),
      'roles': roles,
      'course': course?.toJson(),
      'active': active,
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
    this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.uid,
    this.key,
    this.idExt,
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


class Course {
  final int? id;
  final String? name;
  final String? description;
  final String? abbreviation;
  final Resp? resp;
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
    this.courses,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      abbreviation: json['abbreviation'],
      resp: json['resp'] != null ? Resp.fromJson(json['resp']) : null,
      courseGroupId: json['courseGroupId'],
      isGroup: json['isGroup'],
      courses: json['courses'] != null
          ? (json['courses'] as List)
          .map((courseJson) => Course.fromJson(courseJson))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'abbreviation': abbreviation,
      'resp': resp?.toJson(),
      'courseGroupId': courseGroupId,
      'isGroup': isGroup,
      'courses': courses?.map((course) => course.toJson()).toList(),
    };
  }
}

class Resp {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final ProfilePhoto? profilePhoto;
  final List<String>? roles;
  final bool? active;

  Resp({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePhoto,
    required this.roles,
    required this.active,
  });

  factory Resp.fromJson(Map<String, dynamic> json) {
    return Resp(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhoto.fromJson(json['profilePhoto'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePhoto': profilePhoto?.toJson(),
      'roles': roles,
      'active': active,
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
