part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;

  const factory TransactionState.loading() = _Loading;

  const factory TransactionState.failed({
    required String message,
  }) = _Failed;

  const factory TransactionState.success({
    required PagingController<int, TransactionData> data,
  }) = _Success;
}
