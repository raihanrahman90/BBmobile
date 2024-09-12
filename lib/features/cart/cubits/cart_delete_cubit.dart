import 'package:bbmobile/features/cart/data/cart_delete.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/dio_config.dart';
import '../../../utils/api_helper.dart';
import 'cart_cubit.dart';

part 'cart_delete_state.dart';

part 'cart_delete_cubit.freezed.dart';

class CartDeleteCubit extends Cubit<CartDeleteState> {
  final dio = myDio;
  final CartCubit _cartCubit;

  CartDeleteCubit(this._cartCubit) : super(const CartDeleteState.initial());

  void deleteCart({required String id}) async {
    emit(const CartDeleteState.loading());
    final cartResponse = await makeApiCall<CartDelete>(
      dio: dio,
      endpoint: 'me/cart/$id',
      method: 'delete',
      fromJson: (json) => CartDelete.fromJson(json),
    );

    if (cartResponse.status == ApiCallStatus.success) {
      _cartCubit.getCart();

      emit(const CartDeleteState.success());
    } else {
      emit(
        CartDeleteState.failed(
          message: cartResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
