part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;

  const factory AddressState.loading() = _Loading;

  const factory AddressState.failed({
    required String message,
  }) = _Failed;

  const factory AddressState.success({
    required AddressData data,
  }) = _Success;
}
