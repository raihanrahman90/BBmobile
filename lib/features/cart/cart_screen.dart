import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import '../../config/app_router.gr.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return CartItem(
            onPressedItem: () {},
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Rp. 150.000',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                context.router.push(const PayRoute());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.monetization_on_outlined, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Bayar Sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
