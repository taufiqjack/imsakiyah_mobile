import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imsakiyah_mobile/cores/models/imsakiyah_model/imsakiyah_model.dart';
import 'package:imsakiyah_mobile/cores/repository/imsakiyah_repository.dart';

part 'imsakiyah_state.dart';
part 'imsakiyah_cubit.freezed.dart';

class ImsakiyahCubit extends Cubit<ImsakiyahState> {
  final _repo = ImsakiyahRepository();
  ImsakiyahCubit() : super(const ImsakiyahState.initial());

  Future<ImsakiyahModel?> getImsakiyah(
      dynamic kabupaten, BuildContext context) async {
    try {
      emit(const ImsakiyahState.initial());
      final kab = await _repo.getImsakiyah(kabupaten, context);
      emit(ImsakiyahState.success(kab!));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(ImsakiyahState.error(e.toString()));
    }
    return null;
  }
}
