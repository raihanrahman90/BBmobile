import 'package:dio/dio.dart';
import 'package:bbmobile/config/environment.dart';
import 'package:bbmobile/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<LoginResponse?> login(String username, String password) async {
    final url = '${Environment.baseUrl}/login';

    try {
      // Send the POST request with a JSON body
      final response = await _dio.post(
        url,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      var responseData = LoginResponse.fromJson(response.data);
      // Check if the request was successful
      if (responseData.status == 200) {
        print('${responseData.data.refreshToken} test');
        print('${responseData.data.token} test');// Save tokens to SharedPreferences
        await _saveTokens(responseData.data.refreshToken, responseData.data.token);

        return LoginResponse.fromJson(response.data);
      } else {
        // Handle the error response
        return null;
      }
    } on DioException catch (e) {
      // Handle any exceptions that occur during the request
      print('Error: ${e.response?.data ?? e.message}');
      return null;
    }
  }

  Future<LoginResponse?> register(String username, String password) async {
    final url = '${Environment.baseUrl}/login';

    try {
      // Send the POST request with a JSON body
      final response = await _dio.post(
        url,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response JSON into a LoginResponse object
        return LoginResponse.fromJson(response.data);
      } else {
        // Handle the error response
        return null;
      }
    } on DioException catch (e) {
      // Handle any exceptions that occur during the request
      print('Error: ${e.response?.data ?? e.message}');
      return null;
    }
  }

  Future<LoginResponse?> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');

    if (refreshToken == null) {
      return null;
    }

    final url = '${Environment.baseUrl}/auth/refresh?refreshToken=$refreshToken';

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);

        // Save the new token
        await prefs.setString('token', loginResponse.data.token);

        return loginResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      return null;
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }

  Future<void> _saveTokens(String refreshToken, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refreshToken', refreshToken);
    await prefs.setString('token', token);
  }

  Future<void> someAuthenticatedRequest() async {
    final token = await getToken();

    if (token != null) {
      final response = await _dio.get(
        'http://example.com/protected-route',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      // Handle the response
    } else {
      // Handle the missing token case
    }
  }


}
