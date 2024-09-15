// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductQuery _$ProductQueryFromJson(Map<String, dynamic> json) => ProductQuery(
      name: json['name'] as String?,
      category: json['category'] as String?,
      minPrice: (json['minPrice'] as num?)?.toInt(),
      maxPrice: (json['maxPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductQueryToJson(ProductQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('category', instance.category);
  writeNotNull('minPrice', instance.minPrice);
  writeNotNull('maxPrice', instance.maxPrice);
  return val;
}
