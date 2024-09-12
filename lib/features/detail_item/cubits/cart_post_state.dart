part of 'cart_post_cubit.dart';

@freezed
class CartPostState with _$CartPostState {
  const factory CartPostState.initial() = _Initial;

  const factory CartPostState.loading() = _Loading;

  const factory CartPostState.failed({
    required String message,
  }) = _Failed;

  const factory CartPostState.success() = _Success;
}
