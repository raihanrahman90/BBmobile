import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/register/data/models/register.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/api_helper.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final dio = myDio;

  RegisterCubit() : super(const RegisterState.initial());

  void submitRegister({
    required String username,
    required String password,
  }) async {
    emit(const RegisterState.loading());
    final registerResponse = await makeApiCall<Register>(
      dio: dio,
      endpoint: 'users',
      method: 'post',
      data: {'username': username, 'password': password},
      fromJson: (json) => Register.fromJson(json),
    );

    if (registerResponse.status == ApiCallStatus.success) {
      emit(
        RegisterState.success(data: registerResponse.data?.data),
      );
    } else {
      emit(
        RegisterState.failed(
          message: registerResponse.message ?? 'Something Wrong',
        ),
      );
    }
  }
}
