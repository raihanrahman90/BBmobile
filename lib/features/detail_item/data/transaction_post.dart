import 'package:json_annotation/json_annotation.dart';

part 'transaction_post.g.dart';

@JsonSerializable()
class TransactionPost {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final TransactionPostData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  TransactionPost({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory TransactionPost.fromJson(Map<String, dynamic> json) =>
      _$TransactionPostFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionPostToJson(this);
}

@JsonSerializable()
class TransactionPostData {
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
  final List<Item>? item;

  TransactionPostData({
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

  factory TransactionPostData.fromJson(Map<String, dynamic> json) =>
      _$TransactionPostDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionPostDataToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "item_price")
  final int? itemPrice;
  @JsonKey(name: "item_image")
  final String? itemImage;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "sub_total")
  final int? subTotal;

  Item({
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.amount,
    this.subTotal,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
