part of 'transaction_post_cubit.dart';

@freezed
class TransactionPostState with _$TransactionPostState {
  const factory TransactionPostState.initial() = _Initial;

  const factory TransactionPostState.loading() = _Loading;

  const factory TransactionPostState.failed({
    required String message,
  }) = _Failed;

  const factory TransactionPostState.success({
    required TransactionPostData data,
  }) = _Success;
}
