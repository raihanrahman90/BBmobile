import 'package:bbmobile/features/profile/data/address.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/dio_config.dart';
import '../../../utils/api_helper.dart';

part 'address_cubit.freezed.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final dio = myDio;

  AddressCubit() : super(const AddressState.initial());

  void getAddress() async {
    emit(const AddressState.loading());
    final addressResponse = await makeApiCall<Address>(
      dio: dio,
      endpoint: 'me/address',
      method: 'get',
      fromJson: (json) => Address.fromJson(json),
    );

    if (addressResponse.status == ApiCallStatus.success) {
      emit(
        AddressState.success(
          data: addressResponse.data!.data!,
        ),
      );
    } else {
      emit(
        AddressState.failed(
          message: addressResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
