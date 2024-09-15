import 'package:flutter/material.dart';

class TransactionStatus extends StatelessWidget {
  final String status;

  const TransactionStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: ShapeDecoration(
        color: _getColorForStatus(
          TransactionStatusOption.fromString(status),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Text(
        _getTextForStatus(
          TransactionStatusOption.fromString(status),
        ),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }

  static Color _getColorForStatus(
    TransactionStatusOption status,
  ) {
    switch (status) {
      case TransactionStatusOption.waitingPayment:
        return Colors.yellow;
      case TransactionStatusOption.waitingValidation:
        return Colors.blue;
      case TransactionStatusOption.cancelled:
        return Colors.red;
      case TransactionStatusOption.done:
        return Colors.green;
      default:
        return Colors.yellow;
    }
  }

  static String _getTextForStatus(
    TransactionStatusOption status,
  ) {
    switch (status) {
      case TransactionStatusOption.waitingPayment:
        return 'BELUM BAYAR';
      case TransactionStatusOption.waitingValidation:
        return 'MENUNGGU VALIDASI';
      case TransactionStatusOption.cancelled:
        return 'DIBATALKAN';
      case TransactionStatusOption.done:
        return 'SELESAI';
      default:
        return 'MENUNGGU';
    }
  }
}

enum TransactionStatusOption {
  waitingPayment,
  waitingValidation,
  validatedPayment,
  cancelled,
  done;

  const TransactionStatusOption();

  String get value {
    switch (this) {
      case TransactionStatusOption.waitingPayment:
        return "WAITING_PAYMENT";
      case TransactionStatusOption.waitingValidation:
        return "WAITING_VALIDATION";
      case TransactionStatusOption.validatedPayment:
        return "VALIDATED_PAYMENT";
      case TransactionStatusOption.cancelled:
        return "CANCELLED";
      case TransactionStatusOption.done:
        return "DONE";
    }
  }

  static TransactionStatusOption fromString(String status) {
    return TransactionStatusOption.values.firstWhere(
      (e) => e.value == status,
      orElse: () => throw ArgumentError('Invalid TransactionStatus: $status'),
    );
  }
}
