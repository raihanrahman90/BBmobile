import 'package:bbmobile/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

final myDio = Dio()
  ..options.baseUrl = Environment.baseUrl
  ..options.connectTimeout = const Duration(minutes: 1)
  ..options.receiveTimeout = const Duration(minutes: 1)
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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains('login') &&
        !err.requestOptions.path.contains('users')) {
      // Token has expired, try to refresh it
      try {
        final response = await _refreshToken();
        if (response.statusCode == 200) {
          // Token refresh successful
          final newAccessToken = response.data['data']['token'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', newAccessToken);

          // Update the original request with the new token
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';

          // Repeat the original request with the new token
          final clonedRequest = await myDio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          return handler.resolve(clonedRequest);
        }
      } catch (e) {
        // Token refresh failed, handle accordingly (e.g., log out user)
        debugPrint('Token refresh failed: $e');
      }
    }
    return handler.next(err);
  }

  Future<Response> _refreshToken() async {
    final dio = Dio()..options.baseUrl = Environment.baseUrl;
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');

    return await dio.get(
      '/auth/refresh',
      queryParameters: {
        'refreshToken': refreshToken,
      },
    );
  }
}
