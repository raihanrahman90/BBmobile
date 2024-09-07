import 'package:bbmobile/widgets/transaction_status.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final VoidCallback onPressedItem;

  const TransactionItem({super.key, required this.onPressedItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedItem,
      child: Container(
        padding: const EdgeInsets.all(8),
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
              "https://via.placeholder.com/55x55",
              height: 70,
              width: 70,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TITLE',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'RP. 40000',
                    style: TextStyle(
                      color: const Color(0xFF222222).withOpacity(0.6),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TransactionStatus(status: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
