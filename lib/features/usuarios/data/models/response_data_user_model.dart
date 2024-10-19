class ResponseDataUserModel {
  final int? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final ProfilePhoto? profilePhoto;
  final CoverPhoto? coverPhoto;
  final List<String>? roles;
  final Course? course;

  ResponseDataUserModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.profilePhoto,
    required this.coverPhoto,
    required this.roles,
    required this.course,
  });

  factory ResponseDataUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataUserModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'], // Pode ser null
      phone: json['phone'],
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhoto.fromJson(json['profilePhoto'])
          : null,
      coverPhoto: json['coverPhoto'] != null
          ? CoverPhoto.fromJson(json['coverPhoto'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
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
      'profilePhoto': profilePhoto?.toJson(),
      'coverPhoto': coverPhoto?.toJson(),
      'roles': roles,
      'course': course?.toJson(),
    };
  }
}

class ProfilePhoto {
  final String? name;
  final String? type;
  final String? url;
  final int? size;
  final String? uid;

  ProfilePhoto({
    required this.name,
    required this.type,
    required this.url,
    required this.size,
    required this.uid,
  });

  factory ProfilePhoto.fromJson(Map<String, dynamic> json) {
    return ProfilePhoto(
      name: json['name'],
      type: json['type'],
      url: json['url'],
      size: json['size'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'url': url,
      'size': size,
      'uid': uid,
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

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation,
    required this.resp,
    required this.courseGroupId,
    required this.isGroup,
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

  Resp({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePhoto,
    required this.roles,
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