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

Map<String, dynamic> _$ProductQueryToJson(ProductQuery instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
