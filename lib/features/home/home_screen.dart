import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/config/app_router.gr.dart';
import 'package:bbmobile/widgets/clothing_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hi, NAME',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const CartRoute());
            },
            icon: const Badge(
              isLabelVisible: true,
              label: Text(
                "2",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.amberAccent,
              offset: Offset(5, -5),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best Seller',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sort_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ClothingItem(
                      onPressedItem: () {
                        context.router.push(const DetailRoute());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
