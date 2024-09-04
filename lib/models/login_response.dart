class LoginResponse {
  final bool isSuccess;
  final int status;
  final Data data;
  final String message;
  final int totalPage;
  final int page;

  LoginResponse({
    required this.isSuccess,
    required this.status,
    required this.data,
    required this.message,
    required this.totalPage,
    required this.page,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      isSuccess: json['isSuccess'],
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      totalPage: json['totalPage'],
      page: json['page'],
    );
  }
}

class Data {
  final String refreshToken;
  final String token;

  Data({
    required this.refreshToken,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      refreshToken: json['refreshToken'],
      token: json['token'],
    );
  }
}
