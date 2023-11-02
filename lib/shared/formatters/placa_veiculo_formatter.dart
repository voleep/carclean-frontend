import 'package:flutter/services.dart';

class PlacaVeiculoInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.replaceAll('-', '').length > 7) return oldValue;

    var selectionIndex = newValue.selection.end;
    var substrIndex = 0;
    final newText = StringBuffer();

    if (newValue.text.length > 3) {
      if (newValue.text.contains("-")) {
        newText.write(newValue.text.substring(0, substrIndex = 3));
      } else {
        newText.write(
            '${newValue.text.substring(0, substrIndex = 3)}-${newValue.text.substring(3, substrIndex = newValue.text.length)}');
        selectionIndex++;
      }
    }

    if (newValue.text.length >= substrIndex) {
      newText.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: newText.toString().toUpperCase(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
