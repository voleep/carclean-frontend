import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_section_label/voleep_section_label.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderFormPage extends HookConsumerWidget {
  const ServiceOrderFormPage(
      {super.key, this.serviceOrderId, required this.mode});

  final ServiceOrderId? serviceOrderId;
  final FormMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = useState<CustomerModel?>(null);
    final customerNameController = useTextEditingController();

    final vehicle = useState<VehicleModel?>(null);
    final vehicleNameController = useTextEditingController();

    handleCustomerClick() async {
      final selectedCustomer =
          await context.push(Routes.app.serviceOrder.selectCustomer);
      if (selectedCustomer != null && selectedCustomer is CustomerModel) {
        customer.value = selectedCustomer;
        customerNameController.text = selectedCustomer.dsName;
      }
    }

    handleVehicleClick() async {
      final selectedVehicle =
          await context.push(Routes.app.serviceOrder.selectVehicle);
      if (selectedVehicle != null && selectedVehicle is VehicleModel) {
        vehicle.value = selectedVehicle;
        vehicleNameController.text = selectedVehicle.description;
      }
    }

    return Scaffold(
        appBar: const VoleepAppBar(
          title: Text("Ordem de serviço"),
        ),
        body: ScrollableView(
          child: Form(
            child: Column(
              children: [
                const VoleepSectionLabel("Identificação"),
                RowInline(
                  children: [
                    VoleepTextFormField(
                      width: 550,
                      controller: customerNameController,
                      readOnly: true,
                      placeholder: "Cliente",
                      icon: Icons.person_outline_rounded,
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(left: 20),
                        onPressed: handleCustomerClick,
                        icon: const Icon(
                          Icons.navigate_next_rounded,
                        ),
                      ),
                      onTap: handleCustomerClick,
                    ),
                    VoleepTextFormField(
                      width: 550,
                      controller: vehicleNameController,
                      readOnly: true,
                      placeholder: "Veículo",
                      icon: Icons.local_car_wash_rounded,
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(left: 20),
                        onPressed: handleVehicleClick,
                        icon: const Icon(
                          Icons.navigate_next_rounded,
                        ),
                      ),
                      onTap: handleVehicleClick,
                    ),
                  ],
                ),
                const VoleepSectionLabel("Itens"),
              ],
            ),
          ),
        ));
  }
}
