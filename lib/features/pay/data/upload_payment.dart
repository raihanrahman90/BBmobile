import 'package:json_annotation/json_annotation.dart';

part 'upload_payment.g.dart';

@JsonSerializable()
class UploadPayment {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final UploadPaymentData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  UploadPayment({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory UploadPayment.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPaymentToJson(this);
}

@JsonSerializable()
class UploadPaymentData {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "userID")
  final String? userId;
  @JsonKey(name: "order_item")
  final dynamic orderItem;
  @JsonKey(name: "payment")
  final String? payment;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "proof_of_payment")
  final String? proofOfPayment;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "province")
  final String? province;
  @JsonKey(name: "total")
  final int? total;

  UploadPaymentData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.orderItem,
    this.payment,
    this.date,
    this.status,
    this.proofOfPayment,
    this.address,
    this.city,
    this.province,
    this.total,
  });

  factory UploadPaymentData.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentDataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPaymentDataToJson(this);
}
