class KabupatenModel {
  int? code;
  String? message;
  List<dynamic>? data;

  KabupatenModel({this.code, this.message, this.data});

  factory KabupatenModel.fromJson(Map<String, dynamic> json) {
    return KabupatenModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };
}
