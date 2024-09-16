import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/profile/data/address.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';

part 'address_post_cubit.freezed.dart';

part 'address_post_state.dart';

class AddressPostCubit extends Cubit<AddressPostState> {
  final dio = myDio;

  AddressPostCubit() : super(const AddressPostState.initial());

  void submitNewAddress({required AddressData data}) async {
    emit(const AddressPostState.loading());

    final uploadPaymentResponse = await makeApiCall<Address>(
      dio: dio,
      endpoint: 'me/address',
      method: 'post',
      data: data.toJson(),
      // Encode the entire body as JSON
      fromJson: (json) => Address.fromJson(json),
    );

    if (uploadPaymentResponse.status == ApiCallStatus.success) {
      emit(AddressPostState.success(
        data: uploadPaymentResponse.data!.data!,
      ));
    } else {
      emit(
        AddressPostState.failed(
          message: uploadPaymentResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
