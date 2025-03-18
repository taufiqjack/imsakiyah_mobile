import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imsakiyah_mobile/cores/components/toast.dart';
import 'package:imsakiyah_mobile/cores/constants/cons.dart';
import 'package:imsakiyah_mobile/cores/helpers/dio_exception.dart';
import 'package:imsakiyah_mobile/cores/models/imsakiyah_model/imsakiyah_model.dart';
import 'package:imsakiyah_mobile/cores/models/kabupaten_model.dart';
import 'package:imsakiyah_mobile/cores/models/provinsi_model.dart';
import 'package:imsakiyah_mobile/cores/rest/rest_constract.dart';

class ImsakiyahRepository {
  final _rest = GetIt.instance.get<RestConstract>();

  Future<ProvinsiModel?> getProvinsi(BuildContext context) async {
    try {
      var response = await _rest.getListProvince();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return ProvinsiModel.fromJson(map);
      } else {
        logg.setString(MESSAGE, response.data['message']);
        if (context.mounted) {
          toast(context, logg.getString(MESSAGE).toString());
        }
        throw Exception(map[MESSAGE]);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<KabupatenModel?> getKabupaten(
      dynamic kabupaten, BuildContext context) async {
    try {
      var response = await _rest.getKabupaten(kabupaten);
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return KabupatenModel.fromJson(map);
      } else {
        logg.setString(MESSAGE, response.data['message']);
        if (context.mounted) {
          toast(context, logg.getString(MESSAGE).toString());
        }
        throw Exception(map[MESSAGE]);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<ImsakiyahModel?> getImsakiyah(
      dynamic imsakiyah, BuildContext context) async {
    try {
      var response = await _rest.getImsakiyah(imsakiyah);
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return ImsakiyahModel.fromJson(map);
      } else {
        logg.setString(MESSAGE, response.data['message']);
        if (context.mounted) {
          toast(context, logg.getString(MESSAGE).toString());
        }
        throw Exception(map[MESSAGE]);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
