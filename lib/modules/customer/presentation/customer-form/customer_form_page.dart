import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/extensions/string_extensions.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-form/customer_form_controller.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/formatters/compound/cpf_cpnj_formatter.dart';
import 'package:voleep_carclean_frontend/shared/formatters/telefone_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

final situationSwitchState =
    AutoDisposeStateProvider<DisabledEnabled>((ref) => DisabledEnabled.enabled);

class CustomerFormPage extends ConsumerStatefulWidget {
  const CustomerFormPage({Key? key, this.customerId, required this.mode})
      : super(key: key);

  final CustomerId? customerId;
  final FormMode mode;

  @override
  ConsumerState<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends ConsumerState<CustomerFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _dsNameController = TextEditingController();
  final _dsTelephoneController = TextEditingController();
  final _dsEmailController = TextEditingController();
  final _dsDocumentController = TextEditingController();
  final _dsNoteController = TextEditingController();

  _setCustomerData({required CustomerModel customer}) {
    _dsNameController.text = customer.dsName;
    _dsTelephoneController.text = customer.dsTelephone ?? "";
    _dsEmailController.text = customer.dsEmail ?? "";
    _dsDocumentController.text = customer.dsDocument ?? "";
    _dsNoteController.text = customer.dsNote ?? "";
    ref.read(situationSwitchState.notifier).state = customer.stCustomer;
  }

  @override
  void initState() {
    super.initState();

    ref.listenManual(
        customerFormControllerProvider(widget.customerId, widget.mode),
        (previosData, data) {
      if (data.hasError) {
        data.showSnackBarOnError(context);
      }

      if (data.hasError && !data.hasValue) {
        context.pop();
      }

      if (data.hasValue && !data.hasError) {
        _setCustomerData(customer: data.value!);
      }
    }, fireImmediately: true);
  }

  @override
  Widget build(BuildContext context) {
    final isCreateMode = widget.mode == FormMode.create;

    return Scaffold(
      extendBody: true,
      appBar: VoleepAppBar(
        title: Text(isCreateMode ? "Novo cliente" : "Cliente"),
      ),
      body: ScrollableView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: RowWrap(
              children: [
                VoleepFormField(
                  minWidth: 380,
                  controller: _dsNameController,
                  placeholder: "Nome",
                  icon: Icons.person_outline_rounded,
                  validator: Validators.compose(
                      [Validators.required(), Validators.maxLength(100)]),
                ),
                VoleepFormField(
                  minWidth: 175,
                  controller: _dsDocumentController,
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
                  controller: _dsTelephoneController,
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
                  controller: _dsEmailController,
                  placeholder: "Email",
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  validator: Validators.maxLength(100),
                ),
                VoleepFormField(
                  minWidth: 380,
                  maxLines: null,
                  controller: _dsNoteController,
                  placeholder: "Observações",
                  keyboardType: TextInputType.multiline,
                  icon: Icons.description_outlined,
                  validator: Validators.maxLength(250),
                ),
                Consumer(
                  builder: (context, ref, widget) {
                    final situation = ref.watch(situationSwitchState);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Situação ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                          ),
                          Switch(
                            value: situation.boolean,
                            onChanged: (value) => ref
                                .read(situationSwitchState.notifier)
                                .state = DisabledEnabled.fromBool(value),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            onWillPop: () async {
              final canDeactivate = await showDialog(
                context: context,
                builder: (context) => const CanDeactivateDialog(),
              );
              return canDeactivate;
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await ref
                .read(customerFormControllerProvider(
                        widget.customerId, widget.mode)
                    .notifier)
                .saveOrUpdateCustomer(
                  name: _dsNameController.text,
                  telephone: _dsTelephoneController.text.notEmptyOrNull,
                  email: _dsEmailController.text.notEmptyOrNull,
                  document: _dsDocumentController.text.notEmptyOrNull,
                  notes: _dsNoteController.text.notEmptyOrNull,
                  situation: ref.read(situationSwitchState),
                );

            final hasError = ref
                .read(customerFormControllerProvider(
                    widget.customerId, widget.mode))
                .hasError;

            if (!hasError && context.mounted) {
              context.pop(true);
            }
          }
        },
        label: const Text("Salvar"),
        icon: const Icon(Icons.done_rounded),
      ),
    );
  }
}
