import 'package:bbmobile/features/transaction/data/transaction.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../config/dio_config.dart';
import '../../../utils/api_helper.dart';

part 'transaction_cubit.freezed.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final dio = myDio;
  final PagingController<int, TransactionData> pagingController =
      PagingController(firstPageKey: 1);

  TransactionCubit() : super(const TransactionState.initial());

  void fetchList({required int pageOffSet}) {
    fetchTransaction(page: pageOffSet);
  }

  void getTransaction() async {
    emit(const TransactionState.loading());

    try {
      pagingController.removePageRequestListener(_fetchPage);

      pagingController.addPageRequestListener(_fetchPage);

      emit(TransactionState.success(data: pagingController));
    } catch (e) {
      emit(const TransactionState.failed(message: 'Something Went Wrong'));
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    fetchList(pageOffSet: pageKey);
  }

  Future<void> fetchTransaction({required int page}) async {
    final transactionResponse = await makeApiCall<Transaction>(
      dio: dio,
      endpoint: 'me/transaction',
      method: 'get',
      query: {
        'page': page,
        'pageSize': 7,
      },
      fromJson: (json) => Transaction.fromJson(json),
    );

    if (transactionResponse.status == ApiCallStatus.success) {
      final data = transactionResponse.data?.data ?? [];
      if (data.isEmpty) {
        pagingController.appendLastPage([]);
        return;
      }

      final isLastPage = (page == transactionResponse.data!.totalPage);
      if (isLastPage) {
        pagingController.appendLastPage(data);
      } else {
        final nextPage = (page) + 1;
        pagingController.appendPage(data, nextPage);
      }
    } else {
      pagingController.error = transactionResponse.message ?? 'Something Wrong';
    }
  }
}
