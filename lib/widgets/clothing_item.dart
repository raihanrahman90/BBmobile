import 'package:flutter/material.dart';

class ClothingItem extends StatelessWidget {
  final VoidCallback onPressedItem;

  const ClothingItem({super.key, required this.onPressedItem});

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
              "https://via.placeholder.com/55x55",
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
                    const Text(
                      'Stigma Socialitas',
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'RP. 40.000',
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
