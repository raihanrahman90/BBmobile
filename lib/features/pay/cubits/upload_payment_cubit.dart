import 'dart:convert';

import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/pay/data/upload_payment.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/api_helper.dart';

part 'upload_payment_cubit.freezed.dart';

part 'upload_payment_state.dart';

class UploadPaymentCubit extends Cubit<UploadPaymentState> {
  final dio = myDio;

  UploadPaymentCubit() : super(const UploadPaymentState.initial());

  void uploadPayment({required String id, required XFile paymentProof}) async {
    try {
      emit(const UploadPaymentState.loading());

      // Convert image to base64
      List<int> imageBytes = await paymentProof.readAsBytes();
      String base64Image = "data:image/jpeg;base64,${base64Encode(imageBytes)}";

      // Prepare the body
      final body = {'image': base64Image};

      // API Call
      final uploadPaymentResponse = await makeApiCall<UploadPayment>(
        dio: dio,
        endpoint: 'me/transaction/$id/payment',
        method: 'put',
        data: body,
        fromJson: (json) => UploadPayment.fromJson(json),
        option: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Handle the response
      if (uploadPaymentResponse.status == ApiCallStatus.success) {
        emit(const UploadPaymentState.success());
      } else {
        emit(UploadPaymentState.failed(
          message: uploadPaymentResponse.message ?? 'Something Wrong',
        ));
      }
    } catch (e) {
      debugPrint('Error during uploadPayment: $e');
      emit(const UploadPaymentState.failed(message: 'Upload failed'));
    }
  }
}
