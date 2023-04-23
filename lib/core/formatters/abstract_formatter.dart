import 'package:flutter/services.dart';

abstract class AbstractFormatter extends TextInputFormatter {
  formatValue(final String? value, final String mask) {
    if (value == null) return;
    final StringBuffer output = StringBuffer();

    for (int i = 0; i < mask.length; i++) {
      if (i < value.length) {
        if (mask[i] == '9') {
          if (RegExp(r'\d').hasMatch(value[i])) {
            output.write(value[i]);
          }
        } else if (mask[i] == 'A') {
          if (RegExp('[a-zA-Z]').hasMatch(value[i])) {
            output.write(value[i]);
          }
        } else {
          output.write(mask[i]);
        }
      }


    }

    return output.toString();
  }
}
