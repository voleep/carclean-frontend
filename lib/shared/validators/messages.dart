abstract class Messages {
  static const required = "Campo obrigatório.";

  static const onlyNumber = "Deve conter apenas números.";

  static const onlyText = "Deve conter apenas letras.";

  static const invalidEmail = "E-mail inválido.";

  static const invalidDate = "Data inválida.";

  static const invalidCpf = "CPF inválido.";

  static const invalidCnpj = "CNPJ inválido";

  static String maxLength(int maxLength) => 'Máximo $maxLength caracteres.';

  static String minLength(int minLength) => 'Mínimo $minLength caracteres.';

  const Messages._();
}
