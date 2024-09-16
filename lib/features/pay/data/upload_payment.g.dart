// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPayment _$UploadPaymentFromJson(Map<String, dynamic> json) =>
    UploadPayment(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : UploadPaymentData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadPaymentToJson(UploadPayment instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

UploadPaymentData _$UploadPaymentDataFromJson(Map<String, dynamic> json) =>
    UploadPaymentData(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['userID'] as String?,
      orderItem: json['order_item'],
      payment: json['payment'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      proofOfPayment: json['proof_of_payment'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadPaymentDataToJson(UploadPaymentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userID': instance.userId,
      'order_item': instance.orderItem,
      'payment': instance.payment,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'proof_of_payment': instance.proofOfPayment,
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
      'total': instance.total,
    };
