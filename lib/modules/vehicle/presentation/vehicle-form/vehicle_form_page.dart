import 'package:flutter/material.dart';
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
  final TextEditingController _descriptionControl = TextEditingController();
  final TextEditingController _licensePlateControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Responsive.isMobile(context);

    final controller = ref.watch(vehicleFormPageControllerProvider(vehicleId));
    ref.listen(vehicleFormPageControllerProvider(vehicleId), (previous, next) {
      if (next.hasError) {
        next.showSnackBarOnError(context);
      }
    });

    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Cadastro de veículos"),
      ),
      body: ScrollableView(
        child: controller.when(
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) {
            _descriptionControl.text = data?.description ?? "";
            _licensePlateControl.text = data?.licensePlate ?? "";

            return Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: VoleepTextFormField(
                          controller: _descriptionControl,
                          placeholder: "Descrição",
                          icon: isMobile ? Icons.description_outlined : null,
                          validator: (value) => Validators.maxLength(value, 200)),
                    ),
                    Flexible(
                      flex: 1,
                      child: VoleepTextFormField(
                          controller: _licensePlateControl,
                          placeholder: "Placa",
                          icon: isMobile ? Icons.money_rounded : null,
                          validator: (value) => Validators.maxLength(value, 7)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: controller.whenOrNull(
        data: (value) => FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ref
                  .read(vehicleFormPageControllerProvider(vehicleId).notifier)
                  .saveOrUpdate(
                    description: _descriptionControl.text,
                    licensePlate: _licensePlateControl.text,
                  )
                  .then((value) {
                if (!controller.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Salvo com sucesso!"),
                      behavior: SnackBarBehavior.floating,
                      width: 250,
                    ),
                  );
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
