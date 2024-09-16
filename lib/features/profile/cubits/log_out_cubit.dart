import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'log_out_cubit.freezed.dart';
part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(const LogOutState.initial());

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refreshToken');
    await prefs.remove('token');

    emit(const LogOutState.success());
  }
}
