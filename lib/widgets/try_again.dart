import 'package:flutter/material.dart';

class TryAgain extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const TryAgain({
    super.key,
    required this.message,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onTryAgain,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          child: const Text(
            'Coba Ulang',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
