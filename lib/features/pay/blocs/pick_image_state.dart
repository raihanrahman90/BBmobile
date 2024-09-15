part of 'pick_image_bloc.dart';

@freezed
class PickImageState with _$PickImageState {
  const factory PickImageState.initial() = _Initial;

  const factory PickImageState.picked({
    required File image,
  }) = _Picked;

  const factory PickImageState.failed({
    required String message,
  }) = _Failed;
}
