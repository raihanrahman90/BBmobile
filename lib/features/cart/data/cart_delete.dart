import 'package:json_annotation/json_annotation.dart';

part 'cart_delete.g.dart';

@JsonSerializable()
class CartDelete {
  @JsonKey(name: "isSuccess")
  final bool? isSuccess;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @JsonKey(name: "page")
  final int? page;

  CartDelete({
    this.isSuccess,
    this.status,
    this.data,
    this.message,
    this.totalPage,
    this.page,
  });

  factory CartDelete.fromJson(Map<String, dynamic> json) => _$CartDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$CartDeleteToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "item")
  final Item? item;
  @JsonKey(name: "itemID")
  final String? itemId;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "userID")
  final String? userId;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.item,
    this.itemId,
    this.user,
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "category")
  final dynamic category;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;

  Item({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "access")
  final int? access;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.password,
    this.access,
    this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
