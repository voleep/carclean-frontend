import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/text_editing_controller_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/widget_ref_extension.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_edit_page/service_order_edit_vm.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_form/scaffold_with_form.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_expansion_panel/voleep_expansion_panel.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_tile/voleep_form_tile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';

class ServiceOrderEditPage extends ConsumerStatefulWidget {
  const ServiceOrderEditPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceOrderEditPageState();
}

class _ServiceOrderEditPageState extends ConsumerState<ServiceOrderEditPage> {
  final customerEC = TextEditingController();
  final vehicleEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = serviceOrderEditVmProvider(widget.id);
    final notifier = provider.notifier;

    ref.observe(provider.select((s) => s.customer), changeCustomer);
    ref.observe(provider.select((s) => s.vehicle), changeVehicle);

    return ScaffoldWithForm(
      title: "Ordem de serviço",
      onSubmit: save,
      child: Column(
        children: [
          RowWrap(
            children: [
              VoleepFormField(
                minWidth: 550,
                controller: customerEC,
                readOnly: true,
                placeholder: "Cliente",
                icon: Icons.person_rounded,
                onTap: () => ref.read(notifier).selectCustomer(context),
              ),
              VoleepFormField(
                minWidth: 550,
                controller: vehicleEC,
                readOnly: true,
                placeholder: "Veículo",
                icon: Icons.drive_eta_rounded,
                onTap: () => ref.read(notifier).selectVehicle(context),
              ),
            ],
          ),
          VoleepExpansionPanel("Itens", initiallyExpanded: true, children: [
            Consumer(
              builder: (context, value, child) {
                final services = ref.watch(provider.select((s) => s.items));

                return VoleepFormTile(
                  icon: Icons.playlist_add_rounded,
                  title: "Serviços",
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(services.length.toString()),
                      const Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                  onTap: () => ref.read(notifier).goToServices(context),
                );
              },
            ),
            VoleepFormTile(
              icon: Icons.add_shopping_cart_rounded,
              title: "Produtos",
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("0.0"),
                  Icon(Icons.navigate_next_rounded),
                ],
              ),
              onTap: () => context.push(ServiceOrderRoutes.products),
            ),
            VoleepFormTile(
              icon: Icons.percent_rounded,
              title: "Desconto",
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("0"),
                  Icon(Icons.navigate_next_rounded),
                ],
              ),
              onTap: () {},
            ),
          ]),
          VoleepExpansionPanel("Detalhes", initiallyExpanded: true, children: [
            VoleepFormTile(
              icon: Icons.attach_money_rounded,
              title: "Meio de pagamento",
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.navigate_next_rounded),
                ],
              ),
              onTap: () {},
            ),
          ])
        ],
      ),
    );
  }

  changeCustomer(CustomerModel? customer) {
    customerEC.textOrEmpty = customer?.dsName;
  }

  changeVehicle(VehicleModel? vehicle) {
    vehicleEC.textOrEmpty = vehicle?.description;
  }

  save() async {}

  @override
  void dispose() {
    customerEC.dispose();
    vehicleEC.dispose();

    super.dispose();
  }
}
