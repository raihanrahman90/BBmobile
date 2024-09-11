import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/login/data/login.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/api_helper.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final dio = myDio;

  LoginCubit() : super(const LoginState.initial());

  void submitLogin({
    required String username,
    required String password,
  }) async {
    emit(const LoginState.loading());
    final registerResponse = await makeApiCall<Login>(
        dio: dio,
        endpoint: 'login',
        method: 'post',
        data: {'username': username, 'password': password},
        fromJson: (json) => Login.fromJson(json),
        option: Options(
          validateStatus: (status) {
            if (status == 401) {
              return true;
            } else if (status == 200) {
              return true;
            }
            return false;
          },
        ));

    if (registerResponse.status == ApiCallStatus.success) {
      emit(
        LoginState.success(data: registerResponse.data?.data),
      );
    } else {
      if (registerResponse.data?.status == 400) {
        emit(
          LoginState.failed(
            message: registerResponse.data?.message ?? 'Something Wrong',
          ),
        );
      } else {
        emit(
          LoginState.failed(
            message: registerResponse.message ?? 'Something Wrong',
          ),
        );
      }
    }
  }

  Future<void> saveToken(String refreshToken, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refreshToken', refreshToken);
    await prefs.setString('token', token);
  }
}
