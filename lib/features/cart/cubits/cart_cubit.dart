import 'package:bbmobile/config/dio_config.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';
import '../data/cart.dart';

part 'cart_cubit.freezed.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final dio = myDio;

  CartCubit() : super(const CartState.initial());

  void getCart() async {
    emit(const CartState.loading());
    final cartResponse = await makeApiCall<Cart>(
      dio: dio,
      endpoint: 'me/cart',
      method: 'get',
      fromJson: (json) => Cart.fromJson(json),
    );

    if (cartResponse.status == ApiCallStatus.success) {
      if (cartResponse.data!.data == null) {
        emit(
          const CartState.failed(
            message: 'Tidak Terdapat Barang pada Keranjang',
          ),
        );
      } else {
        emit(
          CartState.success(
            data: cartResponse.data!.data!,
          ),
        );
      }
    } else {
      emit(
        CartState.failed(
          message: cartResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
