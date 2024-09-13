// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionPost _$TransactionPostFromJson(Map<String, dynamic> json) =>
    TransactionPost(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : TransactionPostData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionPostToJson(TransactionPost instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

TransactionPostData _$TransactionPostDataFromJson(Map<String, dynamic> json) =>
    TransactionPostData(
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
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionPostDataToJson(
        TransactionPostData instance) =>
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

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      itemName: json['item_name'] as String?,
      itemPrice: (json['item_price'] as num?)?.toInt(),
      itemImage: json['item_image'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      subTotal: (json['sub_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'item_name': instance.itemName,
      'item_price': instance.itemPrice,
      'item_image': instance.itemImage,
      'amount': instance.amount,
      'sub_total': instance.subTotal,
    };
