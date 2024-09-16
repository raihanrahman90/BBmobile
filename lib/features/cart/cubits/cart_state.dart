part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = _Loading;

  const factory CartState.failed({
    required String message,
  }) = _Failed;

  const factory CartState.success({
    required List<CartData> data,
  }) = _Success;
}
