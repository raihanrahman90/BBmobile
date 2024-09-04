import 'package:bbmobile/models/cart_response.dart';
import 'package:bbmobile/models/items_response.dart';
import 'package:bbmobile/models/pagination.dart';
import 'package:bbmobile/services/api_cart_service.dart';
import 'package:bbmobile/services/api_item_service.dart';
import 'package:bbmobile/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Pagination<CartItem>? pagination;
  final ApiCartService _apiCartService = ApiCartService();

  @override
  void initState() {
    super.initState();
    _fetchCarts();
  }

  Future<void> _fetchCarts() async {
    final fetchedPagination = await _apiCartService.fetchCartItems();
    setState(() {
      pagination = fetchedPagination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: pagination == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Items Section
          Expanded(
            child: ListView.builder(
              itemCount: pagination?.data.length ?? 0,
              itemBuilder: (context, index) {
                final item = pagination!.data[index];
                return ListTile(
                  leading: Image.network(item.itemImage),
                  title: Text(item.itemName),
                  subtitle: Text('Price: ${item.itemPrice}'),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
