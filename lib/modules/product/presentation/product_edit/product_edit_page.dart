import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/entities/product.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_edit/product_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/formatters/real_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_switch/voleep_switch.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class ProductEditPage extends ConsumerStatefulWidget {
  const ProductEditPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductEditPageState();
}

class _ProductEditPageState extends ConsumerState<ProductEditPage> {
  final codeEC = TextEditingController();
  final descriptionEC = TextEditingController();
  final priceEC = TextEditingController();
  final availableStockEC = TextEditingController();
  final pcComissionEC = TextEditingController();
  final situationVN = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final viewModel = productEditVmProvider(widget.id);

    ref.listen(viewModel, (previous, next) {
      next.showSnackBarOnError(context);
      next.popOnFirstError(context, previous);
      next.runOnData(setData);
    });

    return ScaffoldWithForm(
      title: "Produto",
      onSubmit: save,
      child: RowWrap(
        children: [
          Offstage(
            offstage: ref.read(viewModel.notifier).isNew,
            child: VoleepFormField(
              minWidth: 130,
              controller: codeEC,
              enabled: false,
              placeholder: "Código",
              icon: Icons.qr_code_rounded,
            ),
          ),
          VoleepFormField(
            minWidth: 550,
            autofocus: ref.read(viewModel.notifier).isNew ? true : false,
            controller: descriptionEC,
            placeholder: "Produto",
            icon: Icons.description_rounded,
            validator: [
              Validators.required(),
              Validators.maxLength(250),
            ].compose,
          ),
          VoleepFormField(
            minWidth: 160,
            controller: priceEC,
            placeholder: "Preço",
            icon: Icons.request_quote_rounded,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            formatters: [RealInputFormatter()],
          ),
          VoleepFormField(
            minWidth: 180,
            controller: availableStockEC,
            placeholder: "Estoque disponível",
            icon: Icons.inventory_rounded,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
          VoleepFormField(
            minWidth: 210,
            controller: pcComissionEC,
            placeholder: "Comissão por vendedor",
            icon: Icons.payments_rounded,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
          VoleepSwitch(
            title: 'Situação',
            valueNotifier: situationVN,
          )
        ],
      ),
    );
  }

  void setData(Product product) {
    codeEC.text = product.code.toString();
    descriptionEC.text = product.description;
    priceEC.text = "R\$ ${product.price.toStringAsFixed(2)}";
    availableStockEC.text = product.availableStock.toString();
    pcComissionEC.text = "${product.pcCommission.toStringAsFixed(2)} %";
    situationVN.value = product.situation.boolean;
  }

  Future<void> save() async {
    final viewModel = productEditVmProvider(widget.id);

    var doubleRE = RegExp(r"\b\d[\d,.]*\b");

    final price = priceEC.text.isNotEmpty
        ? double.parse(doubleRE.firstMatch(priceEC.text)!.group(0)!)
        : 0.0;
    final availableStock = availableStockEC.text.isNotEmpty
        ? double.parse(doubleRE.firstMatch(availableStockEC.text)!.group(0)!)
        : 0.0;
    final pcCommission = pcComissionEC.text.isNotEmpty
        ? double.parse(doubleRE.firstMatch(pcComissionEC.text)!.group(0)!)
        : 0.0;

    await ref.read(viewModel.notifier).save(
          description: descriptionEC.text,
          price: price,
          availableStock: availableStock,
          pcCommission: pcCommission,
          situation: DisabledEnabled.fromBool(situationVN.value),
        );

    if (context.mounted) {
      ref.read(viewModel).onFormSaved(context);
    }
  }

  @override
  void dispose() {
    codeEC.dispose();
    descriptionEC.dispose();
    priceEC.dispose();
    availableStockEC.dispose();
    pcComissionEC.dispose();
    situationVN.dispose();

    super.dispose();
  }
}
