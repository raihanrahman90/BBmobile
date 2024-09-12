// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartCreate _$CartCreateFromJson(Map<String, dynamic> json) => CartCreate(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartCreateToJson(CartCreate instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };
