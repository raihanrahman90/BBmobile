import 'package:bbmobile/config/dio_config.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';
import '../data/product_detail.dart';

part 'product_detail_state.dart';

part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final dio = myDio;

  ProductDetailCubit() : super(const ProductDetailState.initial());

  void getProductDetail({
    required String id,
  }) async {
    emit(const ProductDetailState.loading());
    final productDetailResponse = await makeApiCall<ProductDetail>(
      dio: dio,
      endpoint: 'item/$id',
      method: 'get',
      fromJson: (json) => ProductDetail.fromJson(json),
    );

    if (productDetailResponse.status == ApiCallStatus.success) {
      emit(
        ProductDetailState.success(
          data: productDetailResponse.data!.data!,
        ),
      );
    } else {
      emit(
        ProductDetailState.failed(
          message: productDetailResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
