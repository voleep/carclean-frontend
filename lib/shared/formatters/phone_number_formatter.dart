import 'package:flutter/services.dart';
import 'package:voleep_carclean_frontend/core/formatters/abstract_formatter.dart';

class PhoneNumberFormatter extends AbstractFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedValue = formatValue(newValue.text, '(99) 99999-9999');
    ;

    return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length));
  }
}
