import 'package:bbmobile/config/dio_config.dart';
import 'package:bbmobile/features/home/data/product_query.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../utils/api_helper.dart';
import '../data/product.dart';

part 'product_cubit.freezed.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final dio = myDio;
  var query = ProductQuery();
  final PagingController<int, ProductData> pagingController =
      PagingController(firstPageKey: 1);

  ProductCubit() : super(const ProductState.initial());

  void fetchList({
    required int pageOffSet,
    required ProductQuery query,
  }) {
    fetchProduct(query: query, page: pageOffSet);
  }

  void changedProductFilter(ProductQuery newQuery) {
    query = newQuery;
    pagingController.refresh();
  }

  void getProduct({
    required ProductQuery query,
    bool? isChangedCategory,
  }) async {
    emit(const ProductState.loading());
    if (isChangedCategory == true) {
      changedProductFilter(query);
    }

    try {
      pagingController.removePageRequestListener(_fetchPage);

      pagingController.addPageRequestListener(_fetchPage);

      emit(ProductState.success(data: pagingController));
    } catch (e) {
      emit(const ProductState.failed(message: 'Something Went Wrong'));
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    fetchList(
      pageOffSet: pageKey,
      query: query,
    );
  }

  Future<void> fetchProduct({
    required ProductQuery query,
    required int page,
  }) async {
    final productResponse = await makeApiCall<Product>(
      dio: dio,
      endpoint: 'item',
      method: 'get',
      query: {
        ...query.toJson(),
        'page': page,
        'pageSize': 7,
      },
      fromJson: (json) => Product.fromJson(json),
    );

    if (productResponse.status == ApiCallStatus.success) {
      final data = productResponse.data?.data ?? [];
      if (data.isEmpty) {
        pagingController.appendLastPage([]);
        return;
      }

      final isLastPage = (page == productResponse.data!.totalPage);
      if (isLastPage) {
        pagingController.appendLastPage(data);
      } else {
        final nextPage = (page) + 1;
        pagingController.appendPage(data, nextPage);
      }
    } else {
      pagingController.error = productResponse.message ?? 'Something Wrong';
    }
  }
}
