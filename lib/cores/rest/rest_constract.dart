import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imsakiyah_mobile/cores/constants/cons.dart';
import 'package:imsakiyah_mobile/cores/models/add_imsakiyah.dart';
import 'package:imsakiyah_mobile/cores/models/add_kabupaten.dart';
import 'package:imsakiyah_mobile/cores/rest/rest_config.dart';

class RestConstract {
  final GetIt _getIt = GetIt.instance;
  late RestConfig _restConfig;
  late Dio _dio;

  RestConstract() {
    _restConfig = _getIt.get<RestConfig>();
    _dio = _restConfig.dio();
  }

  
  Future<Response> getListProvince() async {
    return await _dio.get(provinsi);
  }

  Future<Response> getKabupaten(
    AddKabupaten data,
  ) async {
    return await _dio.post(
      kabupaten,
      data: jsonEncode(data),
    );
  }

  Future<Response> getImsakiyah(
    AddImsakiyah data,
  ) async {
    return await _dio.post(
      imsakiyah,
      data: jsonEncode(data),
    );
  }
}
