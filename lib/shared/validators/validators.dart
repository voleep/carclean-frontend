import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/validators/cnpj_validator.dart';
import 'package:voleep_carclean_frontend/shared/validators/cpf_validator.dart';
import 'package:voleep_carclean_frontend/shared/validators/messages.dart';

extension ComposeValidator on List<FormFieldValidator<String>> {
  FormFieldValidator<String> get compose => Validators.compose(this);
}

abstract class Validators {
  static FormFieldValidator<String> required([String message = Messages.required]) {
    return (value) {
      if (value?.isEmpty ?? true) return message;
      return null;
    };
  }

  static FormFieldValidator<String> regex(RegExp reg, String message) {
    return (value) {
      if (reg.hasMatch(value ?? '')) return null;
      return message;
    };
  }

  static FormFieldValidator<String> text(String? message) {
    return (value) {
      if (RegExp(r'^[a-zA-Z]+$').hasMatch(value ?? '')) return null;
      return message ?? Messages.onlyText;
    };
  }

  static FormFieldValidator<String> min(double min, String message) {
    return (value) {
      if (value?.trim().isEmpty ?? true) return null;
      final dValue = _toDouble(value!);
      if (dValue < min) return message;
      return null;
    };
  }

  static FormFieldValidator<String> max(double max, String message) {
    return (value) {
      if (value?.trim().isEmpty ?? true) return null;
      final dValue = _toDouble(value!);
      if (dValue > max) return message;
      return null;
    };
  }

  static FormFieldValidator<String> minLength(int minLength, [String? message]) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if ((value?.length ?? 0) < minLength) {
        return message ?? Messages.minLength(minLength);
      }
      return null;
    };
  }

  static FormFieldValidator<String> maxLength(int maxLength, [String? message]) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if ((value?.length ?? 0) > maxLength) {
        return message ?? Messages.maxLength(maxLength);
      }
      return null;
    };
  }

  static FormFieldValidator<String> number(String? message) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (double.tryParse(value!) != null) return null;
      return message ?? Messages.onlyNumber;
    };
  }

  static FormFieldValidator<String> email([String message = Messages.invalidEmail]) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      final emailRegex = RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
      if (emailRegex.hasMatch(value!)) return null;
      return message;
    };
  }

  static FormFieldValidator<String> cpfOrCnpj(String? mCpf, String? mCnpj) {
    return (value) {
      if (value?.isEmpty ?? true) return null;

      const int cpfMaxLength = 11;
      final strippedValue = CNPJValidator.strip(value!);

      if (strippedValue.length <= cpfMaxLength) {
        return cpf(mCpf)(value);
      }

      return cnpj(mCpf)(value);
    };
  }

  static FormFieldValidator<String> cpf(String? message) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (CpfValidator.isValid(value!)) return null;
      return message ?? Messages.invalidCpf;
    };
  }

  static FormFieldValidator<String> cnpj(String? message) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (CNPJValidator.isValid(value!)) return null;
      return message ?? Messages.invalidCnpj;
    };
  }

  static FormFieldValidator<String> compose(List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> date(String? message) {
    return (value) {
      final date = DateTime.tryParse(value ?? '');
      if (date == null) {
        return message ?? Messages.invalidDate;
      }
      return null;
    };
  }

  static FormFieldValidator<String> compare(TextEditingController? controller, String message) {
    return (value) {
      final textCompare = controller?.text ?? '';
      if (value == null || textCompare != value) {
        return message;
      }
      return null;
    };
  }

  static FormFieldValidator<String> length(int length, String message) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if ((value?.length ?? 0) != length) return message;
      return null;
    };
  }

  static double _toDouble(String value) {
    value = value.replaceAll(' ', '').replaceAll(',', '');
    return double.parse(value);
  }
}
