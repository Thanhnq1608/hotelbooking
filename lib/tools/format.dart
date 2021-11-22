import 'package:intl/intl.dart';

class MoneyUtility {
  static formatCurrency(int number, {bool isCurrency = true}) {
    final formatter = new NumberFormat.currency(
        locale: "vi_VN", symbol: "", decimalDigits: 0);
    String currency =
        formatter.format(number).trim() + '${isCurrency ? 'đ' : ''}';
    return currency.replaceAll(".", ",");
  }
}
