import 'package:flutter/material.dart';

class TransactionStatus extends StatelessWidget {
  final bool status;

  const TransactionStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (!status) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: ShapeDecoration(
          color: const Color(0xfff6b704),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        child: const Text(
          'Diproses',
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 8,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0xff02987d),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: const Text(
        'Selesai',
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }
}
