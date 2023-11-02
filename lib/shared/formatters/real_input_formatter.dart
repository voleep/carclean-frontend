import 'package:flutter/services.dart';

/// Formata o valor do campo com a máscara `999.999.999,99`.
class RealInputFormatter extends TextInputFormatter {
  RealInputFormatter({this.moeda = false});

  final bool moeda;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 11) return oldValue;

    if (newValue.text.isEmpty) return newValue;

    final valorFinal = StringBuffer();

    if (moeda) {
      valorFinal.write('R\$ ${_adicionarSeparador(newValue.text)}');
    } else {
      valorFinal.write(_adicionarSeparador(newValue.text));
    }

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: valorFinal.length),
    );
  }

  String _adicionarSeparador(String texto) {
    var valorFinal = "";
    var pointCount = 0;
    for (var i = texto.length - 1; i > -1; i--) {
      if (pointCount == 2) {
        valorFinal = ",$valorFinal";
      }

      if ([6, 10].contains(pointCount)) {
        valorFinal = ".$valorFinal";
      }

      pointCount = pointCount + 1;
      valorFinal = texto[i] + valorFinal;
    }

    return valorFinal;
  }
}
