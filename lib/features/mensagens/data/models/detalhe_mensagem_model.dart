class DetalheMensagemModel {
  final String? message;
  final bool? success;
  final MessageData? data;

  DetalheMensagemModel({
    required this.message,
    required this.success,
    required this.data,
  });

  factory DetalheMensagemModel.fromJson(Map<String, dynamic> json) {
    return DetalheMensagemModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: json['data'] != null ? MessageData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class MessageData {
  final String? id;
  final String? title;
  final String? sendDate;
  final String? summary;
  final String? status;
  final String? message;
  final String? responsible;
  final List<AttachmentData>? attachments;
  final List<LinkData>? links;
  final List<CourseData>? courses;

  MessageData({
    required this.id,
    required this.title,
    required this.sendDate,
    required this.summary,
    required this.status,
    required this.message,
    required this.responsible,
    required this.attachments,
    required this.links,
    required this.courses,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      sendDate: json['sendDate'] as String?,
      summary: json['summary'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      responsible: json['responsible'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((item) => AttachmentData.fromJson(item))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((item) => LinkData.fromJson(item))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((item) => CourseData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sendDate': sendDate,
      'summary': summary,
      'status': status,
      'message': message,
      'responsible': responsible,
      'attachments': attachments?.map((item) => item.toJson()).toList(),
      'links': links?.map((item) => item.toJson()).toList(),
      'courses': courses?.map((item) => item.toJson()).toList(),
    };
  }
}

class AttachmentData {
  final String? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;

  AttachmentData({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
  });

  factory AttachmentData.fromJson(Map<String, dynamic> json) {
    return AttachmentData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
      'size': size,
    };
  }
}

class LinkData {
  final String? id;
  final String? title;
  final String? link;

  LinkData({
    required this.id,
    required this.title,
    required this.link,
  });

  factory LinkData.fromJson(Map<String, dynamic> json) {
    return LinkData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
    };
  }
}

class CourseData {
  final String? id;
  final String? name;
  final String? description;
  final String? abbreviation;
  final RespData? resp;
  final String? courseGroupId;
  final bool? isGroup;

  CourseData({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation,
    required this.resp,
    required this.courseGroupId,
    required this.isGroup,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      abbreviation: json['abbreviation'] as String?,
      resp: json['resp'] != null ? RespData.fromJson(json['resp']) : null,
      courseGroupId: json['courseGroupId'] as String?,
      isGroup: json['isGroup'] as bool?,
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

class RespData {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final ProfilePhotoData? profilePhoto;
  final List<String>? roles;
  final bool? active;

  RespData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.profilePhoto,
    required this.roles,
    required this.active,
  });

  factory RespData.fromJson(Map<String, dynamic> json) {
    return RespData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      profilePhoto: json['profilePhoto'] != null
          ? ProfilePhotoData.fromJson(json['profilePhoto'])
          : null,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      active: json['active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'profilePhoto': profilePhoto?.toJson(),
      'roles': roles,
      'active': active,
    };
  }
}

class ProfilePhotoData {
  final String? id;
  final String? name;
  final String? type;
  final String? url;
  final int? size;

  ProfilePhotoData({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.size,
  });

  factory ProfilePhotoData.fromJson(Map<String, dynamic> json) {
    return ProfilePhotoData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
      'size': size,
    };
  }
}
