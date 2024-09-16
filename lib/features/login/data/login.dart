import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final LoginData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  Login({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: "refreshToken")
  final String? refreshToken;
  @JsonKey(name: "token")
  final String? token;

  LoginData({
    this.refreshToken,
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
