import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_cart.g.dart';

@JsonSerializable()
class CountCart {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final int? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  CountCart({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory CountCart.fromJson(Map<String, dynamic> json) =>
      _$CountCartFromJson(json);

  Map<String, dynamic> toJson() => _$CountCartToJson(this);
}
