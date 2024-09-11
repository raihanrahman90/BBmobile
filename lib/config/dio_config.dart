import 'package:bbmobile/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final myDio = Dio()
  ..options.baseUrl = Environment.baseUrl
  ..interceptors.add(DioInterceptor());

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = 'Bearer ${prefs.getString('token')}';
    options.headers['Authorization'] = token;
    return handler.next(options);
  }
}
