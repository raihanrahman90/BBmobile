part of 'cart_delete_cubit.dart';

@freezed
class CartDeleteState with _$CartDeleteState {
  const factory CartDeleteState.initial() = _Initial;
  const factory CartDeleteState.loading() = _Loading;

  const factory CartDeleteState.failed({
    required String message,
  }) = _Failed;

  const factory CartDeleteState.success() = _Success;
}
