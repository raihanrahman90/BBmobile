import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/home/cubits/count_cart_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';
import '../data/cart_create.dart';

part 'cart_post_cubit.freezed.dart';

part 'cart_post_state.dart';

class CartPostCubit extends Cubit<CartPostState> {
  final dio = myDio;
  final CountCartCubit _cartCountCubit;

  CartPostCubit(this._cartCountCubit) : super(const CartPostState.initial());

  void createCart({
    required String id,
  }) async {
    emit(const CartPostState.loading());
    final productDetailResponse = await makeApiCall<CartCreate>(
      dio: dio,
      endpoint: 'me/cart',
      method: 'post',
      data: {'itemId': id},
      fromJson: (json) => CartCreate.fromJson(json),
    );

    if (productDetailResponse.status == ApiCallStatus.success) {
      _cartCountCubit.countCart();

      emit(const CartPostState.success());
    } else {
      emit(
        CartPostState.failed(
          message: productDetailResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
