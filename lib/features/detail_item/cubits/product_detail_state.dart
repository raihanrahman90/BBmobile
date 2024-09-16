part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;

  const factory ProductDetailState.loading() = _Loading;

  const factory ProductDetailState.failed({
    required String message,
  }) = _Failed;

  const factory ProductDetailState.success({
    required ProductDetailData data,
  }) = _Success;
}
