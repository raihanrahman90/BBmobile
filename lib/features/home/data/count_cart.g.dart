// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountCart _$CountCartFromJson(Map<String, dynamic> json) => CountCart(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountCartToJson(CountCart instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };
