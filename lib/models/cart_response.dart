import 'package:dio/dio.dart';

class CartItem {
  final String id;
  final String itemName;
  final int itemPrice;
  final String itemImage;
  final int amount;
  final int subTotal;

  CartItem({
    required this.id,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.amount,
    required this.subTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      itemName: json['item_name'],
      itemPrice: json['item_price'],
      itemImage: json['item_image'],
      amount: json['amount'],
      subTotal: json['sub_total'],
    );
  }
}
