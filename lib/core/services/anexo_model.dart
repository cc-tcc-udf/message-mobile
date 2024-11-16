import 'dart:typed_data';

class AnexoModel {
  final Uint8List file;

  AnexoModel({
    required this.file,
  });

  factory AnexoModel.fromJson(Map<String, dynamic> json) {
    return AnexoModel(
        file: json['file']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file': file,
    };
  }
}

