part of 'citizen_cubit.dart';

@freezed
class CitizenState with _$CitizenState {
  const factory CitizenState.initial() = _Initial;
  const factory CitizenState.error(String message) = _Error;
  const factory CitizenState.success(KabupatenModel? city) = _Success;
}
