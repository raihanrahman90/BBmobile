class Pagination<T> {
  final bool isSuccess;
  final int status;
  final List<T> data;
  final String message;
  final int totalPage;
  final int page;

  Pagination({
    required this.isSuccess,
    required this.status,
    required this.data,
    required this.message,
    required this.totalPage,
    required this.page,
  });

  factory Pagination.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    var dataList = json['data'] as List;
    List<T> items = dataList.map<T>((itemJson) => fromJsonT(itemJson as Map<String, dynamic>)).toList();

    return Pagination(
      isSuccess: json['isSuccess'],
      status: json['status'],
      data: items,
      message: json['message'],
      totalPage: json['totalPage'],
      page: json['page'],
    );
  }
}
