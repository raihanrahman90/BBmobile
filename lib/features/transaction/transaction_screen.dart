import 'package:auto_route/annotations.dart';
import 'package:bbmobile/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Transaksi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TransactionItem(
                    onPressedItem: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
