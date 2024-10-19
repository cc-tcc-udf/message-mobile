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
      message: json['message'] as String,
      success: json['success'] as bool,
      data: MessageData.fromJson(json['data']),
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

class MessageData {
  final int? id;
  final String? title;
  final String? summary;
  final String? status;
  final String? message;
  final String? responsible;
  final List<dynamic>? attachments;
  final List<LinkData>? links;

  MessageData({
    required this.id,
    required this.title,
    required this.summary,
    required this.status,
    required this.message,
    required this.responsible,
    required this.attachments,
    required this.links,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      id: json['id'] as int,
      title: json['title'] as String,
      summary: json['summary'] as String,
      status: json['status'] as String,
      message: json['message'] as String,
      responsible: json['responsible'] as String,
      attachments: json['attachments'] as List<dynamic>,
      links: (json['links'] as List<dynamic>)
          .map((item) => LinkData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'status': status,
      'message': message,
      'responsible': responsible,
      'attachments': attachments,
      'links': links!.map((item) => item.toJson()).toList(),
    };
  }
}

class LinkData {
  final int? id;
  final String? title;
  final String? link;

  LinkData({
    required this.id,
    required this.title,
    required this.link,
  });

  factory LinkData.fromJson(Map<String, dynamic> json) {
    return LinkData(
      id: json['id'] as int,
      title: json['title'] as String,
      link: json['link'] as String,
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
