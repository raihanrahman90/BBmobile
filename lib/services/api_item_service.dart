import 'package:bbmobile/config/environment.dart';
import 'package:bbmobile/models/items_response.dart';
import 'package:bbmobile/models/pagination.dart';
import 'package:dio/dio.dart';

class ApiItemService {
  final Dio _dio = Dio();

  Future<Pagination<Item>> fetchItems({int page = 1, int pageSize = 5, String name = '', int? minPrice, int? maxPrice}) async {
    var url = '${Environment.baseUrl}/item?page=$page&pageSize=$pageSize&name=$name';
    if(minPrice != null) url = '$url&minPrice=$minPrice';
    if(maxPrice != null) url = '$url&maxPrice=$maxPrice';
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Pagination.fromJson(response.data, (itemJson) => Item.fromJson(itemJson));
      } else {
        print('Failed to load items');
        return Pagination(
          isSuccess: false,
          status: response.statusCode!,
          data: [],
          message: 'Failed to load items',
          totalPage: 0,
          page: 0,
        );
      }
    } catch (e) {
      print('Error fetching items: $e');
      return Pagination(
        isSuccess: false,
        status: 500,
        data: [],
        message: 'Error fetching items',
        totalPage: 0,
        page: 0,
      );
    }
  }

  Future<Item?> fetchItemById(String id) async {
    final url = '${Environment.baseUrl}/item/$id';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Item.fromJson(response.data);
      } else {
        print('Failed to load items');
        return null;
      }
    } catch (e) {
      print('Error fetching items: $e');
      return null;
    }
  }
}
