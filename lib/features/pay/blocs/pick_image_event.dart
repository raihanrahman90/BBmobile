part of 'pick_image_bloc.dart';

@freezed
class PickImageEvent with _$PickImageEvent {
  const factory PickImageEvent.imageTaken({
    required XFile? imageFile,
  }) = _ImageTaken;
}
