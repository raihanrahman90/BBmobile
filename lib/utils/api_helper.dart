import 'package:dio/dio.dart';

enum ApiCallStatus { success, failed }

class ApiResponse<T> {
  final ApiCallStatus status;
  final T? data;
  final String? message;

  ApiResponse({required this.status, this.data, this.message});
}

Future<ApiResponse<T>> makeApiCall<T>({
  required Dio dio,
  required String endpoint,
  required String method,
  Map<String, dynamic>? data,
  T Function(Map<String, dynamic>)? fromJson,
  Options? option,
}) async {
  try {
    Response response;
    switch (method.toLowerCase()) {
      case 'get':
        response = await dio.get(endpoint);
        break;
      case 'post':
        response = await dio.post(
          endpoint,
          data: data,
          options: option,
        );
        break;
      case 'put':
        response = await dio.put(
          endpoint,
          data: data,
          options: option,
        );
        break;
      case 'delete':
        response = await dio.delete(endpoint);
        break;
      default:
        throw ArgumentError('Unsupported HTTP method: $method');
    }

    if (response.statusCode == 200) {
      return ApiResponse(
        status: ApiCallStatus.success,
        data: fromJson != null ? fromJson(response.data) : response.data,
      );
    } else {
      return ApiResponse(
        status: ApiCallStatus.failed,
        message: 'Request failed with status: ${response.statusCode}',
        data: fromJson != null ? fromJson(response.data) : response.data,
      );
    }
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return ApiResponse(
        status: ApiCallStatus.failed,
        message: 'Connection timed out',
      );
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return ApiResponse(
        status: ApiCallStatus.failed,
        message: 'Failed to receive response',
      );
    } else if (e.response != null) {
      return ApiResponse(
        status: ApiCallStatus.failed,
        message:
            'Error ${e.response?.statusCode}: ${e.response?.statusMessage}',
      );
    } else {
      return ApiResponse(
        status: ApiCallStatus.failed,
        message: 'An unexpected error occurred: ${e.message}',
      );
    }
  } catch (e) {
    return ApiResponse(
      status: ApiCallStatus.failed,
      message: 'An unexpected error occurred: $e',
    );
  }
}
