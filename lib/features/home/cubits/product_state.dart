part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.failed({
    required String message,
  }) = _Failed;

  const factory ProductState.success({
    required PagingController<int, ProductData> data,
  }) = _Success;
}
