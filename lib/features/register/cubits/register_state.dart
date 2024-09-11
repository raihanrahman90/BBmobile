part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = _Loading;

  const factory RegisterState.failed({
    required String message,
  }) = _Failed;

  const factory RegisterState.success({
    required RegisterData? data,
  }) = _Success;
}
