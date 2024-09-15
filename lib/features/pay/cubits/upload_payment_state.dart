part of 'upload_payment_cubit.dart';

@freezed
class UploadPaymentState with _$UploadPaymentState {
  const factory UploadPaymentState.initial() = _Initial;

  const factory UploadPaymentState.loading() = _Loading;

  const factory UploadPaymentState.failed({
    required String message,
  }) = _Failed;

  const factory UploadPaymentState.success() = _Success;
}
