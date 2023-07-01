import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle-form/vehicle_form_page_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class VehicleFormPage extends ConsumerWidget {
  VehicleFormPage({super.key, required this.vehicleId});

  final VehicleId vehicleId;
  final _descriptionControl = TextEditingController();
  final _licensePlateControl = TextEditingController();
  final _modelYearControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Responsive.isMobile(context);

    final controller = ref.watch(vehicleFormPageControllerProvider(vehicleId));
    ref.listen(vehicleFormPageControllerProvider(vehicleId), (previous, next) {
      if (next.hasError) {
        next.showSnackBarOnError(context);
      }

      if (next.hasError && !next.hasValue) {
        context.pop();
      }

      if (next.hasValue && !next.hasError) {
        _descriptionControl.text = next.value?.description ?? "";
        _licensePlateControl.text = next.value?.licensePlate ?? "";
        _modelYearControl.text = next.value?.modelYear ?? "";
      }
    });

    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Veículo"),
      ),
      body: ScrollableView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 3,
                  child: VoleepTextFormField(
                      controller: _descriptionControl,
                      placeholder: "Descrição",
                      icon: isMobile ? Icons.description_outlined : null,
                      validator: (value) => Validators.listOf([
                            () => Validators.required(value),
                            () => Validators.maxLength(value, 100),
                          ])),
                ),
                Flexible(
                  flex: 1,
                  child: VoleepTextFormField(
                    controller: _licensePlateControl,
                    placeholder: "Placa",
                    icon: isMobile ? Icons.money_rounded : null,
                    validator: (value) => Validators.listOf([
                      () => Validators.required(value),
                      () => Validators.maxLength(value, 7),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: VoleepTextFormField(
                      controller: _modelYearControl,
                      placeholder: "Ano",
                      icon: isMobile ? Icons.event_rounded : null,
                      validator: (value) => Validators.maxLength(value, 20)),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: controller.whenOrNull(
        data: (value) => FloatingActionButton.extended(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final notifier = ref.read(vehicleFormPageControllerProvider(vehicleId).notifier);
              final existsByLicensePlate = await notifier.existsByLicensePlate(_licensePlateControl.text);

              if (existsByLicensePlate) {
                if (context.mounted) {
                  final shouldProceed = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Placa duplicada"),
                      content: const Text("Já existe um veículo cadastrado com a mesma placa. Deseja continuar mesmo assim?"),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(false),
                          child: const Text("CANCELAR"),
                        ),
                        TextButton(
                          onPressed: () => context.pop(true),
                          child: const Text("CONTINUAR"),
                        ),
                      ],
                    ),
                  );

                  if (!shouldProceed) {
                    return;
                  }
                } else {
                  return;
                }
              }

              await notifier
                  .saveOrUpdate(
                description: _descriptionControl.text,
                licensePlate: _licensePlateControl.text,
                modelYear: _modelYearControl.text,
              )
                  .then((value) {
                if (!controller.hasError) {
                  context.pop(true);
                }
              });
            }
          },
          label: const Text("Salvar"),
          icon: const Icon(Icons.done_rounded),
        ),
      ),
    );
  }
}
