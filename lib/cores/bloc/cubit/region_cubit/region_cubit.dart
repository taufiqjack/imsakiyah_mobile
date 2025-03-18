import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imsakiyah_mobile/cores/models/provinsi_model.dart';
import 'package:imsakiyah_mobile/cores/repository/imsakiyah_repository.dart';

part 'region_state.dart';
part 'region_cubit.freezed.dart';

class RegionCubit extends Cubit<RegionState> {
  final _repo = ImsakiyahRepository();
  RegionCubit() : super(const RegionState.initial());

  Future<ProvinsiModel?> listRegion(BuildContext context) async {
    try {
      emit(const RegionState.initial());
      final listBook = await _repo.getProvinsi(context);
      emit(RegionState.success(listBook!));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(RegionState.error(e.toString()));
    }
    return null;
  }
}
