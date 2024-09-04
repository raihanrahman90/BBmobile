import 'package:bbmobile/models/address_response.dart';
import 'package:dio/dio.dart';

class ApiAddressService {
  final Dio _dio = Dio();

  Future<List<Address>> fetchAddresses() async {
    final url = 'http://bware.com/me/address';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        return data.map((json) => Address.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load addresses');
      }
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      throw Exception('Failed to load addresses');
    }
  }
}
