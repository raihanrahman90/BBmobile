import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_create.g.dart';

@JsonSerializable()
class CartCreate {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  CartCreate({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory CartCreate.fromJson(Map<String, dynamic> json) =>
      _$CartCreateFromJson(json);

  Map<String, dynamic> toJson() => _$CartCreateToJson(this);
}
