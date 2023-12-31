import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_edit/service_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/formatters/real_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class ServiceEditPage extends ConsumerStatefulWidget {
  const ServiceEditPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceEditPageState();
}

class _ServiceEditPageState extends ConsumerState<ServiceEditPage> {
  final codeEC = TextEditingController();
  final descriptionEC = TextEditingController();
  final fullDescriptionEC = TextEditingController();
  final priceEC = TextEditingController();
  final pcComissionEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = serviceEditVmProvider(widget.id);

    ref.listen(viewModel, (previous, next) {
      next.showSnackBarOnError(context);
      next.popOnFirstError(context, previous);
      next.runOnData(setData);
    });

    return ScaffoldWithForm(
      title: "Serviço",
      onSubmit: save,
      child: RowWrap(children: [
        VoleepFormField(
          minWidth: 130,
          controller: codeEC,
          enabled: false,
          placeholder: "Código",
          icon: Icons.qr_code_rounded,
        ),
        VoleepFormField(
          minWidth: 550,
          autofocus: ref.read(viewModel.notifier).isNew ? true : false,
          controller: descriptionEC,
          placeholder: "Descrição",
          icon: Icons.description_rounded,
          validator: [
            Validators.required(),
            Validators.minLength(3),
            Validators.maxLength(250),
          ].compose,
        ),
        VoleepFormField(
          minWidth: 550,
          controller: fullDescriptionEC,
          placeholder: "Descrição completa",
          icon: Icons.subject_rounded,
          validator: [
            Validators.required(),
            Validators.minLength(3),
            Validators.maxLength(999),
          ].compose,
        ),
        VoleepFormField(
          minWidth: 160,
          controller: priceEC,
          placeholder: "Valor",
          icon: Icons.attach_money_rounded,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          validator: Validators.required(),
          formatters: [RealInputFormatter()],
        ),
        VoleepFormField(
          minWidth: 260,
          controller: pcComissionEC,
          placeholder: "Comissão por vendedor",
          icon: Icons.payments_rounded,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
        ),
      ]),
    );
  }

  void setData(Service service) {
    codeEC.text = service.code.toString();
    descriptionEC.text = service.description;
    fullDescriptionEC.text = service.fullDescription;
    priceEC.text = "R\$ ${service.price.toStringAsFixed(2)}";
    pcComissionEC.text = "${service.pcCommission.toStringAsFixed(2)} %";
  }

  Future<void> save() async {
    final viewModel = serviceEditVmProvider(widget.id);

    var doubleRE = RegExp(r"\b\d[\d,.]*\b");

    final price = double.parse(doubleRE.firstMatch(priceEC.text)!.group(0)!);
    final pcCommission = pcComissionEC.text.isNotEmpty
        ? double.parse(doubleRE.firstMatch(pcComissionEC.text)!.group(0)!)
        : 0.0;

    await ref.read(viewModel.notifier).save(
          description: descriptionEC.text,
          fullDescription: fullDescriptionEC.text,
          price: price,
          pcCommission: pcCommission,
        );

    if (context.mounted) {
      ref.read(viewModel).onFormSaved(context);
    }
  }

  @override
  void dispose() {
    codeEC.dispose();
    descriptionEC.dispose();
    fullDescriptionEC.dispose();
    priceEC.dispose();
    pcComissionEC.dispose();

    super.dispose();
  }
}
