// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) =>
    TransactionData(
      id: json['id'] as String?,
      itemName: json['item_name'] as String?,
      itemPrice: (json['item_price'] as num?)?.toInt(),
      itemImage: json['item_image'] as String?,
      countItem: (json['count_item'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      proofOfPayment: json['proof_of_payment'] as String?,
      item: json['item'],
    );

Map<String, dynamic> _$TransactionDataToJson(TransactionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'item_price': instance.itemPrice,
      'item_image': instance.itemImage,
      'count_item': instance.countItem,
      'total': instance.total,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'proof_of_payment': instance.proofOfPayment,
      'item': instance.item,
    };
