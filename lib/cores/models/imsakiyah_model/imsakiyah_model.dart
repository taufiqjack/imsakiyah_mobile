import 'datum.dart';

class ImsakiyahModel {
  int? code;
  String? message;
  List<Datum>? data;

  ImsakiyahModel({this.code, this.message, this.data});

  factory ImsakiyahModel.fromJson(Map<String, dynamic> json) {
    return ImsakiyahModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
