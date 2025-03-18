import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/citizen_cubit/citizen_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/imsakiyah_cubit/imsakiyah_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/region_cubit/region_cubit.dart';
import 'package:imsakiyah_mobile/cores/rest/network_interceptor.dart';
import 'package:imsakiyah_mobile/cores/rest/rest_config.dart';
import 'package:imsakiyah_mobile/cores/rest/rest_constract.dart';

class Injection {
  late RestConfig _restApi;
  late Dio _dio;
  final locator = GetIt.instance;

  Alice alice = Alice(
    showNotification: true,
  );

  Injection.init() {
    _initDependencies();
  }

  Future _initDependencies() async {
    if (!kIsWeb) {
      locator.registerSingleton<Alice>(alice);
    }

    _dio = Dio(RestConfig.options());
    List<Interceptor> interceptors = [];
    if (kDebugMode) {
      _dio.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
    }

    interceptors.add(NetworkInterceptor());
    _dio.interceptors.addAll(interceptors);

    _restApi = RestConfig(_dio);
    locator.registerSingleton<RestConfig>(_restApi);
    locator.registerSingleton<RestConstract>(RestConstract());
    locator.registerSingleton<RegionCubit>(RegionCubit());
    locator.registerSingleton<CitizenCubit>(CitizenCubit());
    locator.registerSingleton<ImsakiyahCubit>(ImsakiyahCubit());
  }
}
