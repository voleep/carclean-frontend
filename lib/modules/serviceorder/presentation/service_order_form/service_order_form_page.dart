import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/presentation/service_order_form/service_order_form_controller.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderFormPage extends ConsumerStatefulWidget {
  const ServiceOrderFormPage({super.key, this.serviceOrderId, required this.mode});

  final ServiceOrderId? serviceOrderId;
  final FormMode mode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServiceOrderFormPageState();
}

class _ServiceOrderFormPageState extends ConsumerState<ServiceOrderFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _codeControl = TextEditingController();
  final _descriptionControl = TextEditingController();
  final _fullDescriptionControl = TextEditingController();
  final _priceControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(serviceOrderFormControllerProvider(widget.serviceOrderId, widget.mode), (_, value) {
      if (value.hasError) {
        value.showSnackBarOnError(context);
      }

      if (value.hasValue) {
        _codeControl.text = value.value!.code.toString();
        _descriptionControl.text = value.value!.description;
        _fullDescriptionControl.text = value.value!.fullDescription;
        _priceControl.text = "R\$ ${value.value!.price.toStringAsFixed(2)}";
      }
    }, fireImmediately: true);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Ordem de Serviço"),
      ),
      body: ScrollableView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
          child: Form(
            key: _formKey,
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Visibility(
                    visible: widget.mode == FormMode.update,
                    child: VoleepTextFormField(
                      controller: _codeControl,
                      enabled: false,
                      placeholder: "Código",
                      icon: isMobile ? Icons.qr_code_rounded : null,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: VoleepTextFormField(
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
                ),
                Flexible(
                  flex: 3,
                  child: VoleepTextFormField(
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
                ),
                Flexible(
                  flex: 1,
                  child: VoleepTextFormField(
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
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final notifier = ref.read(serviceOrderFormControllerProvider(widget.serviceOrderId, widget.mode).notifier);

            var doubleRE = RegExp(r"\b\d[\d,.]*\b");

            final price = double.parse(doubleRE.firstMatch(_priceControl.text)!.group(0)!);

            await notifier
                .saveOrUpdate(
              description: _descriptionControl.text,
              fullDescription: _fullDescriptionControl.text,
              price: price,
            )
                .then((value) {
              if (!ref.read(serviceOrderFormControllerProvider(widget.serviceOrderId, widget.mode)).hasError) {
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
