import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:voleep_carclean_frontend/core/extensions/widget_ref_extension.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_edit/employee_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/formatters/telefone_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_switch/voleep_switch.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';

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
  final statusVN = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final viewModel = employeeEditVmProvider(widget.id);

    ref.changed(viewModel.select((s) => s.name), changeName);
    ref.changed(viewModel.select((s) => s.phone), changePhone);
    ref.changed(viewModel.select((s) => s.registrationDate), changeDate);
    ref.changed(viewModel.select((s) => s.status), changeStatus);

    return ScaffoldWithForm(
      title: 'Colaborador',
      onSubmit: ref.read(viewModel.notifier).save,
      child: RowWrap(
        children: [
          VoleepFormField(
            minWidth: 550,
            controller: nameEC,
            placeholder: "Nome",
            icon: Icons.person_rounded,
            autofocus: ref.read(viewModel.notifier).isNew ? true : false,
            onChanged: ref.read(viewModel.notifier).changeName,
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
            onChanged: ref.read(viewModel.notifier).changePhone,
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
            title: 'Status',
            valueNotifier: statusVN,
            onChanged: ref.read(viewModel.notifier).changeStatus,
          ),
        ],
      ),
    );
  }

  changeName(String name) {
    nameEC.text = name;
  }

  changePhone(String? phone) {
    telephoneEC.text = phone ?? "";
  }

  changeDate(DateTime date) {
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm");
    registrationDateEC.text = dateFormat.format(date);
  }

  changeStatus(EmployeeStatus status) {
    statusVN.value = status.boolean;
  }

  @override
  void dispose() {
    nameEC.dispose();
    telephoneEC.dispose();
    registrationDateEC.dispose();
    statusVN.dispose();

    super.dispose();
  }
}
