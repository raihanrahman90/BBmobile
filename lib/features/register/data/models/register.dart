import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final RegisterData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  Register({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

@JsonSerializable()
class RegisterData {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "access")
  final int? access;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;

  RegisterData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.password,
    this.access,
    this.refreshToken,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}
