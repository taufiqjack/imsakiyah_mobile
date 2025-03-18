part of 'imsakiyah_cubit.dart';

@freezed
class ImsakiyahState with _$ImsakiyahState {
  const factory ImsakiyahState.initial() = _Initial;
  const factory ImsakiyahState.error(String message) = _Error;
  const factory ImsakiyahState.success(ImsakiyahModel? imsakiyah) = _Success;
}
