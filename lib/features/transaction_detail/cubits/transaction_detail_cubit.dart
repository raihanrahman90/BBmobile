import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/cart/data/transaction_post.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';

part 'transaction_detail_state.dart';

part 'transaction_detail_cubit.freezed.dart';

class TransactionDetailCubit extends Cubit<TransactionDetailState> {
  final dio = myDio;

  TransactionDetailCubit() : super(const TransactionDetailState.initial());

  void getDetailTransaction({required String id}) async {
    emit(const TransactionDetailState.loading());
    final cartResponse = await makeApiCall<TransactionPost>(
      dio: dio,
      endpoint: 'me/transaction/$id',
      method: 'get',
      fromJson: (json) => TransactionPost.fromJson(json),
    );

    if (cartResponse.status == ApiCallStatus.success) {
      emit(
        TransactionDetailState.success(
          data: cartResponse.data!.data!,
        ),
      );
    } else {
      emit(
        TransactionDetailState.failed(
          message: cartResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
