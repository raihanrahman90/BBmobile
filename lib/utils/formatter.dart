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
