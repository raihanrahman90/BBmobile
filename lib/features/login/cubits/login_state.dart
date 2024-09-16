part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.failed({
    required String message,
  }) = _Failed;

  const factory LoginState.success({
    required LoginData? data,
  }) = _Success;
}
