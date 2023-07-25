import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_form/service_form_controller.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceFormPage extends ConsumerStatefulWidget {
  const ServiceFormPage({super.key, this.serviceId, required this.mode});

  final ServiceId? serviceId;
  final FormMode mode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceFormPageState();
}

class _ServiceFormPageState extends ConsumerState<ServiceFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _codeControl = TextEditingController();
  final _descriptionControl = TextEditingController();
  final _fullDescriptionControl = TextEditingController();
  final _priceControl = TextEditingController();
  final _pcComissionControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(
        ServiceFormControllerProvider(widget.serviceId, widget.mode),
        (_, value) {
      if (value.hasError) {
        value.showSnackBarOnError(context);
      }

      if (value.hasError && !value.hasValue) {
        context.pop();
      }

      if (value.hasValue && !value.hasError) {
        _codeControl.text = value.value!.code.toString();
        _descriptionControl.text = value.value!.description;
        _fullDescriptionControl.text = value.value!.fullDescription;
        _priceControl.text = "R\$ ${value.value!.price.toStringAsFixed(2)}";
        _pcComissionControl.text =
            "${value.value!.pcCommission.toStringAsFixed(2)} %";
      }
    }, fireImmediately: true);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: VoleepAppBar(
        title:
            Text(widget.mode == FormMode.update ? "Serviço" : "Novo serviço"),
      ),
      body: ScrollableView(
        child: Form(
          key: _formKey,
          child: RowInline(children: [
            Visibility(
              visible: widget.mode == FormMode.update,
              child: VoleepTextFormField(
                width: 130,
                controller: _codeControl,
                enabled: false,
                placeholder: "Código",
                icon: isMobile ? Icons.qr_code_rounded : null,
              ),
            ),
            VoleepTextFormField(
              width: 550,
              autofocus: widget.mode == FormMode.create ? true : false,
              controller: _descriptionControl,
              placeholder: "Descrição",
              icon: isMobile ? Icons.description_rounded : null,
              validator: (value) => Validators.listOf(
                [
                  () => Validators.required(value),
                  () => Validators.minLength(value, 3),
                  () => Validators.maxLength(value, 250),
                ],
              ),
            ),
            VoleepTextFormField(
              width: 550,
              controller: _fullDescriptionControl,
              placeholder: "Descrição completa",
              icon: isMobile ? Icons.subject_rounded : null,
              validator: (value) => Validators.listOf(
                [
                  () => Validators.required(value),
                  () => Validators.minLength(value, 3),
                  () => Validators.maxLength(value, 999),
                ],
              ),
            ),
            VoleepTextFormField(
              width: 160,
              controller: _priceControl,
              placeholder: "Valor",
              icon: isMobile ? Icons.attach_money_rounded : null,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validator: (value) => Validators.required(value),
              inputFormatters: [
                NumberTextInputFormatter(
                  integerDigits: 16,
                  decimalDigits: 2,
                  decimalSeparator: '.',
                  insertDecimalDigits: true,
                  prefix: "R\$ ",
                ),
              ],
            ),
            VoleepTextFormField(
              width: 260,
              controller: _pcComissionControl,
              placeholder: "Comissão por vendedor",
              icon: isMobile ? Icons.payments_rounded : null,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              inputFormatters: [
                NumberTextInputFormatter(
                  integerDigits: 3,
                  decimalDigits: 2,
                  maxValue: '100.00',
                  decimalSeparator: '.',
                  insertDecimalDigits: true,
                  suffix: " %",
                ),
              ],
            ),
          ]),
          onWillPop: () async {
            final canDeactivate = await showDialog(
              context: context,
              builder: (context) => const CanDeactivateDialog(),
            );
            return canDeactivate;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final notifier = ref.read(
                serviceFormControllerProvider(widget.serviceId, widget.mode)
                    .notifier);

            var doubleRE = RegExp(r"\b\d[\d,.]*\b");

            final price = double.parse(
                doubleRE.firstMatch(_priceControl.text)!.group(0)!);
            final pcCommission = _pcComissionControl.text.isNotEmpty
                ? double.parse(
                    doubleRE.firstMatch(_pcComissionControl.text)!.group(0)!)
                : 0.0;

            await notifier
                .saveOrUpdate(
              description: _descriptionControl.text,
              fullDescription: _fullDescriptionControl.text,
              price: price,
              pcCommission: pcCommission,
            )
                .then((value) {
              if (!ref
                  .read(serviceFormControllerProvider(
                      widget.serviceId, widget.mode))
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
