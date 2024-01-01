import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/extensions/string_extensions.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_edit/customer_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/formatters/compound/cpf_cpnj_formatter.dart';
import 'package:voleep_carclean_frontend/shared/formatters/telefone_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_switch/voleep_switch.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class CustomerEditPage extends ConsumerStatefulWidget {
  const CustomerEditPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  ConsumerState<CustomerEditPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends ConsumerState<CustomerEditPage> {
  final nameEC = TextEditingController();
  final telephoneEC = TextEditingController();
  final emailEC = TextEditingController();
  final documentEC = TextEditingController();
  final noteEC = TextEditingController();
  final situationVN = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    ref.listen(customerEditVmProvider(widget.id), (previous, next) {
      next.showSnackBarOnError(context);
      next.popOnFirstError(context, previous);
      next.runOnData(setData);
    });

    return ScaffoldWithForm(
      title: "Cliente",
      onSubmit: save,
      child: RowWrap(
        children: [
          VoleepFormField(
            minWidth: 380,
            controller: nameEC,
            placeholder: "Nome",
            icon: Icons.person_outline_rounded,
            validator: [
              Validators.required(),
              Validators.maxLength(100),
            ].compose,
          ),
          VoleepFormField(
            minWidth: 175,
            controller: documentEC,
            placeholder: "CPF/CNPJ",
            icon: Icons.badge_outlined,
            keyboardType: TextInputType.phone,
            validator: Validators.maxLength(20),
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfCnpjFormatter()
            ],
          ),
          VoleepFormField(
            minWidth: 195,
            controller: telephoneEC,
            placeholder: "Telefone",
            keyboardType: TextInputType.phone,
            icon: Icons.phone_outlined,
            validator: Validators.maxLength(20),
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
          ),
          VoleepFormField(
            minWidth: 380,
            controller: emailEC,
            placeholder: "Email",
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_outlined,
            validator: Validators.maxLength(100),
          ),
          VoleepFormField(
            minWidth: 380,
            maxLines: null,
            controller: noteEC,
            placeholder: "Observações",
            keyboardType: TextInputType.multiline,
            icon: Icons.description_outlined,
            validator: Validators.maxLength(250),
          ),
          VoleepSwitch(
            title: "Situação",
            valueNotifier: situationVN,
          )
        ],
      ),
    );
  }

  void setData(CustomerModel customer) {
    nameEC.text = customer.dsName;
    telephoneEC.text = customer.dsTelephone ?? "";
    emailEC.text = customer.dsEmail ?? "";
    documentEC.text = customer.dsDocument ?? "";
    noteEC.text = customer.dsNote ?? "";
    situationVN.value = customer.stCustomer.boolean;
  }

  Future<void> save() async {
    final customerViewModel = customerEditVmProvider(widget.id);

    await ref.read(customerViewModel.notifier).save(
          name: nameEC.text,
          telephone: telephoneEC.text.notEmptyOrNull,
          email: emailEC.text.notEmptyOrNull,
          document: documentEC.text.notEmptyOrNull,
          notes: noteEC.text.notEmptyOrNull,
          situation: DisabledEnabled.fromBool(situationVN.value),
        );

    if (context.mounted) {
      ref.read(customerViewModel).popOnData(context);
    }
  }

  @override
  void dispose() {
    nameEC.dispose();
    telephoneEC.dispose();
    emailEC.dispose();
    documentEC.dispose();
    noteEC.dispose();
    situationVN.dispose();

    super.dispose();
  }
}
