part of 'address_post_cubit.dart';

@freezed
class AddressPostState with _$AddressPostState {
  const factory AddressPostState.initial() = _Initial;

  const factory AddressPostState.loading() = _Loading;

  const factory AddressPostState.failed({
    required String message,
  }) = _Failed;

  const factory AddressPostState.success({
    required AddressData data,
  }) = _Success;
}
