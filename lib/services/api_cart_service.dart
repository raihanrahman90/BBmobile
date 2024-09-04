import 'package:bbmobile/models/cart_response.dart';
import 'package:bbmobile/models/pagination.dart';
import 'package:dio/dio.dart';

class ApiCartService {
  final Dio _dio = Dio();

  Future<int> fetchCartCount() async {
    final url = '{{host}}/me/cart/count';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception('Failed to load cart count');
      }
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      throw Exception('Failed to load cart count');
    }
  }

  Future<Pagination<CartItem>> fetchCartItems() async {
    const url = '{{host}}/me/cart';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Pagination.fromJson(response.data, (itemJson) => CartItem.fromJson(itemJson));
      } else {
        throw Exception('Failed to load cart items');
      }
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      throw Exception('Failed to load cart items');
    }
  }
}
