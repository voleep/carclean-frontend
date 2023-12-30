import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/extensions/string_extensions.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_edit/employee_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/formatters/telefone_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_switch/voleep_switch.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class EmployeeEditPage extends ConsumerStatefulWidget {
  const EmployeeEditPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<EmployeeEditPage> createState() => _EmployeeEditPageState();
}

class _EmployeeEditPageState extends ConsumerState<EmployeeEditPage> {
  final nameEC = TextEditingController();
  final telephoneEC = TextEditingController();
  final registrationDateEC = TextEditingController();
  final situationVN = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final viewModel = employeeEditVmProvider(widget.id);

    ref.listen(viewModel, (previous, next) {
      next.showSnackBarOnError(context);
      next.popOnFirstError(context, previous);
      next.runOnData(setData);
    });

    return ScaffoldWithForm(
      title: 'Colaborador',
      onSubmit: save,
      child: RowWrap(
        children: [
          VoleepFormField(
            minWidth: 550,
            controller: nameEC,
            placeholder: "Nome",
            icon: Icons.person_rounded,
            autofocus: ref.read(viewModel.notifier).isNew ? true : false,
            validator: [
              Validators.required(),
              Validators.maxLength(100),
            ].compose,
          ),
          VoleepFormField(
            minWidth: 195,
            controller: telephoneEC,
            placeholder: "Telefone",
            icon: Icons.phone_rounded,
            validator: Validators.maxLength(20),
            keyboardType: TextInputType.phone,
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
          ),
          Visibility(
            visible: !ref.read(viewModel.notifier).isNew,
            child: VoleepFormField(
              minWidth: 200,
              enabled: false,
              controller: registrationDateEC,
              placeholder: "Data do cadastro",
              icon: Icons.event_rounded,
            ),
          ),
          VoleepSwitch(
            title: 'Situação',
            valueNotifier: situationVN,
          ),
        ],
      ),
    );
  }

  void setData(Employee employee) {
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm");
    nameEC.text = employee.name;
    telephoneEC.text = employee.telephone ?? "";
    registrationDateEC.text = dateFormat.format(employee.registrationDate);
    situationVN.value = employee.situation.boolean;
  }

  Future<void> save() async {
    final viewModel = employeeEditVmProvider(widget.id);

    await ref.read(viewModel.notifier).save(
          name: nameEC.text,
          telephone: telephoneEC.text.notEmptyOrNull,
          situation: DisabledEnabled.fromBool(situationVN.value),
        );

    if (context.mounted) {
      ref.read(viewModel).onFormSaved(context);
    }
  }

  @override
  void dispose() {
    nameEC.dispose();
    telephoneEC.dispose();
    registrationDateEC.dispose();
    situationVN.dispose();

    super.dispose();
  }
}
