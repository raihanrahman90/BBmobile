import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/cart/data/transaction_post.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';
import '../../home/cubits/count_cart_cubit.dart';

part 'transaction_post_cubit.freezed.dart';
part 'transaction_post_state.dart';

class TransactionPostCubit extends Cubit<TransactionPostState> {
  final dio = myDio;
  final Map<String, int> cartItem = {};
  final CountCartCubit _countCartCubit;

  TransactionPostCubit(
    this._countCartCubit,
  ) : super(const TransactionPostState.initial());

  void changeQty({required String itemId, required int qty}) {
    cartItem[itemId] = qty;
  }

  void submitTransaction() async {
    emit(const TransactionPostState.loading());
    final transactionPostResponse = await makeApiCall<TransactionPost>(
      dio: dio,
      endpoint: 'me/transaction',
      method: 'post',
      data: cartItem,
      fromJson: (json) => TransactionPost.fromJson(json),
    );

    if (transactionPostResponse.status == ApiCallStatus.success) {
      _countCartCubit.resetCart();

      emit(
        TransactionPostState.success(
          data: transactionPostResponse.data!.data!,
        ),
      );
    } else {
      emit(
        TransactionPostState.failed(
          message: transactionPostResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
