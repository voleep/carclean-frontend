import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/extensions/string_extensions.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_edit/vehicle_edit_vm.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/widgets/duplicated_plate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/formatters/placa_veiculo_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class VehicleEditPage extends ConsumerStatefulWidget {
  const VehicleEditPage({super.key, required this.vehicleId});

  final VehicleId vehicleId;

  @override
  ConsumerState<VehicleEditPage> createState() => _VehicleEditPageState();
}

class _VehicleEditPageState extends ConsumerState<VehicleEditPage> {
  final descriptionEC = TextEditingController();
  final licensePlateEC = TextEditingController();
  final modelYearEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(vehicleEditVmProvider(widget.vehicleId), (previous, next) {
      next.showSnackBarOnError(context);
      next.popOnFirstError(context, previous);
      next.runOnData((vehicle) {
        descriptionEC.text = vehicle.description;
        licensePlateEC.text = vehicle.licensePlate;
        modelYearEC.text = vehicle.modelYear ?? "";
      });
    });

    return ScaffoldWithForm(
      title: "Veículo",
      onValidate: validate,
      onSubmit: save,
      child: RowWrap(
        children: [
          VoleepFormField(
            minWidth: 550,
            controller: descriptionEC,
            placeholder: "Descrição",
            icon: Icons.description_outlined,
            validator: [
              Validators.required(),
              Validators.maxLength(100),
            ].compose,
          ),
          VoleepFormField(
            minWidth: 150,
            controller: licensePlateEC,
            placeholder: "Placa",
            icon: Icons.money_rounded,
            validator: [
              Validators.required(),
              Validators.maxLength(7),
            ].compose,
            formatters: [PlacaVeiculoInputFormatter()],
          ),
          VoleepFormField(
            minWidth: 150,
            controller: modelYearEC,
            placeholder: "Ano",
            icon: Icons.event_rounded,
            validator: Validators.maxLength(20),
          ),
        ],
      ),
    );
  }

  Future<bool> validate() async {
    final notifier = ref.read(vehicleEditVmProvider(widget.vehicleId).notifier);
    final existsResult = await notifier.existsByPlate(licensePlateEC.text);
    if (!context.mounted) return false;

    switch (existsResult) {
      case Success(:final value):
        {
          if (!value) return true;

          final shouldProceed = await showDialog(
            context: context,
            builder: (context) => const DuplicatedPlateDialog(),
          );

          return shouldProceed;
        }
      case Failure():
        return false;
    }
  }

  Future<void> save() async {
    final notifier = ref.read(vehicleEditVmProvider(widget.vehicleId).notifier);

    await notifier.save(
      description: descriptionEC.text,
      licensePlate: licensePlateEC.text,
      modelYear: modelYearEC.text.notEmptyOrNull,
    );

    if (context.mounted) {
      ref.read(vehicleEditVmProvider(widget.vehicleId)).popOnData(context);
    }
  }

  @override
  void dispose() {
    descriptionEC.dispose();
    licensePlateEC.dispose();
    modelYearEC.dispose();

    super.dispose();
  }
}
