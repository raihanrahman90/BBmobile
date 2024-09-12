import 'package:json_annotation/json_annotation.dart';

part 'product_query.g.dart';

@JsonSerializable()
class ProductQuery {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "minPrice")
  final int? minPrice;
  @JsonKey(name: "maxPrice")
  final int? maxPrice;

  ProductQuery({
    this.name,
    this.category,
    this.minPrice,
    this.maxPrice,
  });

  factory ProductQuery.fromJson(Map<String, dynamic> json) =>
      _$ProductQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductQueryToJson(this);
}
