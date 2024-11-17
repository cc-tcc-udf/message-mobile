

class ResponseListCoursesModel {
  final List<CourseGroup>? data;
  final bool? success;
  final String? message;

  ResponseListCoursesModel({
    required this.data,
    required this.success,
    required this.message,
  });

  factory ResponseListCoursesModel.fromJson(Map<String, dynamic> json) {
    return ResponseListCoursesModel(
      data: json['data'] != null
          ? List<CourseGroup>.from(
              (json['data'] as List<dynamic>)
                  .map((e) => CourseGroup.fromJson(e as Map<String, dynamic>)),
            )
          : null,
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'success': success,
      'message': message,
    };
  }
}

class CourseGroup {
  final String? id;
  final String? name;
  final String? abbreviation;
  final List<Course>? courses;

  CourseGroup({
    required this.id,
    required this.name,
    this.abbreviation,
    this.courses,
  });

  factory CourseGroup.fromJson(Map<String, dynamic> json) {
    return CourseGroup(
      id: json['id'],
      name: json['name'],
      abbreviation: json['abbreviation'],
      courses: json['courses'] != null
          ? List<Course>.from(
              (json['courses'] as List<dynamic>)
                  .map((e) => Course.fromJson(e as Map<String, dynamic>)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'abbreviation': abbreviation,
      'courses': courses?.map((e) => e.toJson()).toList(),
    };
  }
}

class Course {
  final String? id;
  final String? name;
  final String? abbreviation;
  final String? courseGroupId;

  Course(
      {required this.id,
      required this.name,
      this.abbreviation,
      this.courseGroupId});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      abbreviation: json['abbreviation'],
      courseGroupId: json['courseGroupId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'abbreviation': abbreviation,
      'courseGroupId': courseGroupId,
    };
  }
}
