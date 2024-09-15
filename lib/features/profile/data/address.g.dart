// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      address: json['Address'] as String?,
      city: json['City'] as String?,
      province: json['Province'] as String?,
      username: json['Username'] as String?,
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'City': instance.city,
      'Province': instance.province,
      'Username': instance.username,
    };
