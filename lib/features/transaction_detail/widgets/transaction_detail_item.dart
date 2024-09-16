import 'package:bbmobile/features/cart/data/transaction_post.dart';
import 'package:flutter/material.dart';

import '../../../utils/formatter.dart';
import '../../cart/widgets/counter_qty.dart';

class TransactionDetailItem extends StatelessWidget {
  final Item data;

  const TransactionDetailItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x0C005DDD),
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Image.network(
            data.itemImage ?? "https://via.placeholder.com/55x55",
            height: 100,
            width: 90,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.itemName ?? '',
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Formatter.currencyFormat(
                      data.itemPrice.toString(),
                    ),
                    style: TextStyle(
                      color: const Color(0xFF222222).withOpacity(0.6),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CounterQty(
            initialQty: data.amount ?? 1,
            isTransactionDetail: true,
            onQtyChanged: (qty) {},
          ),
        ],
      ),
    );
  }
}
