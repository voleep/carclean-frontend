abstract class Validators {
  static String? required(final String? value, [final String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "Campo obrigatório";
    }

    return null;
  }

  static String? maxLength(final String? value, final int maxLength,
      [final String? message]) {
    if (value == null || value.isEmpty) return null;

    if (value.length > maxLength) {
      return message ?? "Máximo de $maxLength caracteres excedido";
    }

    return null;
  }

  static String? minLength(final String? value, final int minLength,
      [final String? message]) {
    if (value == null || value.isEmpty) return null;

    if (value.length < minLength) {
      return message ?? "É necessário no mínimo $minLength caracteres";
    }

    return null;
  }

  static String? email(final String? value, [final String? message]) {
    if (value == null || value.isEmpty) return null;

    bool isValidEmail = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);

    if (!isValidEmail) {
      return message ?? "Email inválido";
    }

    return null;
  }

  static String? match(final String? value, final String expectedValue, [final String? message]) {
    if (value == null || value.isEmpty) return null;

    if (value != expectedValue) {
      return message ?? "Valor não coincide";
    }

    return null;
  }

  static String? listOf(final List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
