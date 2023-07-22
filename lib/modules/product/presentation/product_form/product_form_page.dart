import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_form/product_form_controller.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

final situationSwitchState = AutoDisposeStateProvider<bool>((ref) => true);

class ProductFormPage extends ConsumerStatefulWidget {
  const ProductFormPage({super.key, this.productId, required this.mode});

  final String? productId;
  final FormMode mode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductFormPageState();
}

class _ProductFormPageState extends ConsumerState<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _codeControl = TextEditingController();
  final _descriptionControl = TextEditingController();
  final _priceControl = TextEditingController();
  final _availableStockControl = TextEditingController();
  final _pcComissionControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(
        productFormControllerProvider(widget.productId, widget.mode),
        (_, value) {
      if (value.hasError) {
        value.showSnackBarOnError(context);
      }

      if (value.hasError && !value.hasValue) {
        context.pop();
      }

      if (value.hasValue && !value.hasError) {
        ref.read(situationSwitchState.notifier).state =
            value.value!.situation == 1 ? true : false;
        _codeControl.text = value.value!.code.toString();
        _descriptionControl.text = value.value!.description;
        _priceControl.text = "R\$ ${value.value!.price.toStringAsFixed(2)}";
        _availableStockControl.text = value.value!.availableStock.toString();
        _pcComissionControl.text =
            "${value.value!.pcCommission.toStringAsFixed(2)} %";
      }
    }, fireImmediately: true);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isCreateMode = widget.mode == FormMode.create;
    final isUpdateMode = widget.mode == FormMode.update;

    final situationSwitcher = Consumer(builder: (context, ref, widget) {
      final value = ref.watch(situationSwitchState);
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Situação ",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          Switch(
            value: value,
            onChanged: (value) =>
                ref.read(situationSwitchState.notifier).state = value,
          ),
        ],
      );
    });

    return Scaffold(
      appBar: VoleepAppBar(
        title: Text(isCreateMode ? "Novo produto" : "Produto"),
      ),
      body: ScrollableView(
        child: Form(
          key: _formKey,
          child: RowInline(
            children: [
              Visibility(
                visible: isUpdateMode,
                child: VoleepTextFormField(
                  width: 130,
                  controller: _codeControl,
                  enabled: false,
                  placeholder: "Código",
                  icon: isMobile ? Icons.qr_code_rounded : null,
                ),
              ),
              Visibility(visible: isMobile, child: situationSwitcher),
              VoleepTextFormField(
                width: 550,
                autofocus: widget.mode == FormMode.create ? true : false,
                controller: _descriptionControl,
                placeholder: "Produto",
                icon: isMobile ? Icons.description_rounded : null,
                validator: (value) => Validators.listOf(
                  [
                    () => Validators.required(value),
                    () => Validators.maxLength(value, 250),
                  ],
                ),
              ),
              VoleepTextFormField(
                width: 160,
                controller: _priceControl,
                placeholder: "Preço",
                icon: isMobile ? Icons.request_quote_rounded : null,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
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
                width: 180,
                controller: _availableStockControl,
                placeholder: "Estoque disponível",
                icon: isMobile ? Icons.inventory_rounded : null,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: [
                  NumberTextInputFormatter(
                    integerDigits: 16,
                    decimalDigits: 3,
                    allowNegative: true,
                    decimalSeparator: '.',
                  ),
                ],
              ),
              VoleepTextFormField(
                width: 210,
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
              Visibility(visible: !isMobile, child: situationSwitcher),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final notifier = ref.read(
                productFormControllerProvider(widget.productId, widget.mode)
                    .notifier);

            var doubleRE = RegExp(r"\b\d[\d,.]*\b");

            final price = _priceControl.text.isNotEmpty
                ? double.parse(
                    doubleRE.firstMatch(_priceControl.text)!.group(0)!)
                : 0.0;
            final availableStock = _availableStockControl.text.isNotEmpty
                ? double.parse(
                    doubleRE.firstMatch(_availableStockControl.text)!.group(0)!)
                : 0.0;
            final pcCommission = _pcComissionControl.text.isNotEmpty
                ? double.parse(
                    doubleRE.firstMatch(_pcComissionControl.text)!.group(0)!)
                : 0.0;

            await notifier
                .saveOrUpdate(
              description: _descriptionControl.text,
              price: price,
              availableStock: availableStock,
              pcCommission: pcCommission,
              situation: ref.read(situationSwitchState) ? 1 : 0,
            )
                .then((value) {
              if (!ref
                  .read(productFormControllerProvider(
                      widget.productId, widget.mode))
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
