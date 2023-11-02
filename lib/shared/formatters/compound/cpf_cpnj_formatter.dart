import 'package:voleep_carclean_frontend/shared/formatters/cnpj_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/formatters/compound/compound_formatter.dart';
import 'package:voleep_carclean_frontend/shared/formatters/cpf_input_formatter.dart';

class CpfCnpjFormatter extends CompoundFormatter {
  CpfCnpjFormatter() : super([CpfInputFormatter(), CnpjInputFormatter()]);
}
