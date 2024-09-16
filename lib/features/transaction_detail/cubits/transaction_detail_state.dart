part of 'transaction_detail_cubit.dart';

@freezed
class TransactionDetailState with _$TransactionDetailState {
  const factory TransactionDetailState.initial() = _Initial;

  const factory TransactionDetailState.loading() = _Loading;

  const factory TransactionDetailState.failed({
    required String message,
  }) = _Failed;

  const factory TransactionDetailState.success({
    required TransactionPostData data,
  }) = _Success;
}
