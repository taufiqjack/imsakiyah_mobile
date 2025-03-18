class ProvinsiModel {
  int? code;
  String? message;
  List<dynamic>? data;

  ProvinsiModel({this.code, this.message, this.data});

  factory ProvinsiModel.fromJson(Map<String, dynamic> json) => ProvinsiModel(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };
}
