import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final ProductDetailData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  ProductDetail({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}

@JsonSerializable()
class ProductDetailData {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "rating")
  final int? rating;

  ProductDetailData({
    this.id,
    this.name,
    this.price,
    this.description,
    this.image,
    this.category,
    this.rating,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailDataToJson(this);
}
