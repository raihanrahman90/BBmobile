import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_bloc.freezed.dart';

part 'pick_image_event.dart';

part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  XFile? photoTaken;

  PickImageBloc() : super(const PickImageState.initial()) {
    on<PickImageEvent>((event, emit) async {
      event.when(
        imageTaken: (imageFile) {
          try {
            if (imageFile == null) {
              emit(const PickImageState.initial());
            } else {
              final imageTemp = File(imageFile.path);
              emit(PickImageState.picked(image: imageTemp));
            }
          } on PlatformException catch (e) {
            debugPrint(e.message);
            emit(
              const PickImageState.failed(message: 'Gagal Mengambil Foto'),
            );
          } catch (e) {
            debugPrint(e.toString());
            emit(
              const PickImageState.failed(message: 'Gagal Mengambil Foto'),
            );
          }
        },
      );
    });
  }
}
