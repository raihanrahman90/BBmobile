import 'package:bbmobile/features/home/data/product.dart';
import 'package:bbmobile/utils/formatter.dart';
import 'package:flutter/material.dart';

class ClothingItem extends StatelessWidget {
  final ProductData data;
  final VoidCallback onPressedItem;

  const ClothingItem({
    super.key,
    required this.onPressedItem,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedItem,
      child: Container(
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
              data.image ?? "https://via.placeholder.com/55x55",
              height: 70,
              width: 70,
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
                      data.name ?? '-',
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Formatter.currencyFormat(
                        data.price.toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
