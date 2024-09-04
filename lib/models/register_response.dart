class RegisterResponse {
  final bool isSuccess;
  final int status;
  final String message;
  final int totalPage;
  final int page;

  RegisterResponse({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.totalPage,
    required this.page,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      isSuccess: json['isSuccess'],
      status: json['status'],
      message: json['message'],
      totalPage: json['totalPage'],
      page: json['page'],
    );
  }
}
