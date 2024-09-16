import 'package:bbmobile/features/home/data/count_cart.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/dio_config.dart';
import '../../../utils/api_helper.dart';

part 'count_cart_state.dart';

part 'count_cart_cubit.freezed.dart';

class CountCartCubit extends Cubit<CountCartState> {
  final dio = myDio;

  CountCartCubit() : super(const CountCartState.initial());

  void resetCart() {
    emit(const CountCartState.initial());
  }

  void countCart() async {
    final countCartResponse = await makeApiCall<CountCart>(
      dio: dio,
      endpoint: 'me/cart/count',
      method: 'get',
      fromJson: (json) => CountCart.fromJson(json),
    );

    if (countCartResponse.status == ApiCallStatus.success) {
      if (countCartResponse.data?.data != null &&
          countCartResponse.data?.data != 0) {
        emit(
          CountCartState.success(cart: countCartResponse.data?.data ?? 0),
        );
      }
    }
  }
}
