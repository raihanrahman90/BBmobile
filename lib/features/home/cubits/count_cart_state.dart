part of 'count_cart_cubit.dart';

@freezed
class CountCartState with _$CountCartState {
  const factory CountCartState.initial() = _Initial;

  const factory CountCartState.success({
    required int cart,
  }) = _Success;
}
