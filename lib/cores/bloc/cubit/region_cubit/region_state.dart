part of 'region_cubit.dart';

@freezed
class RegionState with _$RegionState {
  const factory RegionState.initial() = _Initial;
  const factory RegionState.error(String message) = _Error;
  const factory RegionState.success(ProvinsiModel? region) = _Success;
}
