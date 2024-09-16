import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String formattedDate({
    required DateTime? date,
    required String format,
  }) {
    DateFormat dateFormat = DateFormat(format, 'id');
    if (date == null) return '-';
    return dateFormat.format(date);
  }

  static String currencyFormat(String? value) {
    if (value != null) {
      final currencyFormatter = NumberFormat('#,##0', 'ID');
      return 'Rp. ${currencyFormatter.format(double.parse(value))}';
    }
    return '';
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final cleanValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final formattedValue = Formatter.currencyFormat(
      cleanValue.trim(),
    );

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
