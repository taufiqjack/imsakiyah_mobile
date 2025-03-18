import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imsakiyah_mobile/cores/models/kabupaten_model.dart';
import 'package:imsakiyah_mobile/cores/repository/imsakiyah_repository.dart';

part 'citizen_state.dart';
part 'citizen_cubit.freezed.dart';

class CitizenCubit extends Cubit<CitizenState> {
  final _repo = ImsakiyahRepository();
  CitizenCubit() : super(const CitizenState.initial());

  Future<KabupatenModel?> getCity(
      dynamic provinsi, BuildContext context) async {
    try {
      emit(const CitizenState.initial());
      final listBook = await _repo.getKabupaten(provinsi, context);
      emit(CitizenState.success(listBook!));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(CitizenState.error(e.toString()));
    }
    return null;
  }

  void reset() {
    emit(const CitizenState.initial());
  }
}
