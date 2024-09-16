import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<TransactionData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  Transaction({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class TransactionData {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "item_price")
  final int? itemPrice;
  @JsonKey(name: "item_image")
  final String? itemImage;
  @JsonKey(name: "count_item")
  final int? countItem;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "proof_of_payment")
  final String? proofOfPayment;
  @JsonKey(name: "item")
  final dynamic item;

  TransactionData({
    this.id,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.countItem,
    this.total,
    this.date,
    this.status,
    this.proofOfPayment,
    this.item,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDataToJson(this);
}
