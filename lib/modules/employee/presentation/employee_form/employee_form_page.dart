import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/extensions/string_extensions.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_form/employee_form_controller.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

final situationSwitchState =
    AutoDisposeStateProvider<DisabledEnabled>((ref) => DisabledEnabled.enabled);

class EmployeeFormPage extends ConsumerWidget {
  EmployeeFormPage({super.key, this.employeeId, required this.mode});

  final EmployeeId? employeeId;
  final FormMode mode;

  final _formKey = GlobalKey<FormState>();

  final _nameControl = TextEditingController();
  final _telephoneControl = TextEditingController();
  final _registrationDateControl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Responsive.isMobile(context);
    ref.listen(employeeFormControllerProvider(employeeId, mode), (_, value) {
      if (value.hasError) {
        value.showSnackBarOnError(context);
      }

      if (value.hasError && !value.hasValue) {
        context.pop();
      }

      if (value.hasValue && !value.hasError) {
        final dateFormat = DateFormat("dd/MM/yyyy HH:mm");
        ref.read(situationSwitchState.notifier).state = value.value!.situation;
        _nameControl.text = value.value!.name;
        _telephoneControl.text = value.value!.telephone ?? "";
        _registrationDateControl.text =
            dateFormat.format(value.value!.registrationDate);
      }
    });

    return Scaffold(
      appBar: VoleepAppBar(
        title:
            Text(mode == FormMode.create ? "Novo colaborador" : "Colaborador"),
      ),
      body: ScrollableView(
        child: Form(
          key: _formKey,
          child: RowInline(
            children: [
              VoleepTextFormField(
                width: 550,
                autofocus: mode == FormMode.create ? true : false,
                controller: _nameControl,
                placeholder: "Nome",
                icon: isMobile ? Icons.person_rounded : null,
                validator: (value) => Validators.listOf(
                  [
                    () => Validators.required(value),
                    () => Validators.maxLength(value, 100),
                  ],
                ),
              ),
              VoleepTextFormField(
                width: 195,
                controller: _telephoneControl,
                placeholder: "Telefone",
                icon: isMobile ? Icons.phone_rounded : null,
                validator: (value) => Validators.maxLength(value, 20),
                keyboardType: TextInputType.phone,
              ),
              Visibility(
                visible: mode == FormMode.update,
                child: VoleepTextFormField(
                  width: 200,
                  enabled: false,
                  controller: _registrationDateControl,
                  placeholder: "Data do cadastro",
                  icon: isMobile ? Icons.event_rounded : null,
                ),
              ),
              Consumer(
                builder: (context, ref, widget) {
                  final situation = ref.watch(situationSwitchState);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Situação ",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      Switch(
                        value: situation.boolean,
                        onChanged: (value) => ref
                            .read(situationSwitchState.notifier)
                            .state = DisabledEnabled.fromBool(value),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final notifier = ref.read(
                employeeFormControllerProvider(employeeId, mode).notifier);

            await notifier
                .saveOrUpdate(
              name: _nameControl.text,
              telephone: _telephoneControl.text.notEmptyOrNull,
              situation: ref.read(situationSwitchState),
            )
                .then((value) {
              if (!ref
                  .read(employeeFormControllerProvider(employeeId, mode))
                  .hasError) {
                context.pop(true);
              }
            });
          }
        },
        label: const Text("Salvar"),
        icon: const Icon(Icons.done_rounded),
      ),
    );
  }
}
