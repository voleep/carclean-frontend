import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_expansion_panel/voleep_expansion_panel.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_tile/voleep_form_tile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class ServiceOrderFormPage extends ConsumerStatefulWidget {
  const ServiceOrderFormPage({
    super.key,
    this.serviceOrderId,
    required this.mode,
  });

  final ServiceOrderId? serviceOrderId;
  final FormMode mode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceOrderFormPageState();
}

class _ServiceOrderFormPageState extends ConsumerState<ServiceOrderFormPage> {
  final _formKey = GlobalKey<FormState>();

  final customerNameController = TextEditingController();

  final vehicleNameController = TextEditingController();

  var serviceItemList = <ServiceOrderItemModel>[];

  final serviceTotal = 0;

  handleCustomerClick() {
    GoRouter.of(context)
        .push(Routes.app.serviceOrder.selectCustomer)
        .then((value) {
      if (value != null && value is CustomerModel) {
        //customer.value = selectedCustomer;
        customerNameController.text = value.dsName;
      }
    });
  }

  handleVehicleClick() {
    GoRouter.of(context)
        .push(Routes.app.serviceOrder.selectVehicle)
        .then((value) {
      if (value != null && value is Vehicle) {
        //vehicle.value = selectedVehicle;
        vehicleNameController.text = value.description;
      }
    });
  }

  handleServiceClick() {
    context
        .push(Routes.app.serviceOrder.serviceList, extra: serviceItemList)
        .then((value) {
      if (value != null && value is List<ServiceOrderItemModel>) {
        serviceItemList = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Ordem de serviço"),
      ),
      body: ScrollableView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              RowWrap(
                children: [
                  VoleepFormField(
                    minWidth: 550,
                    controller: customerNameController,
                    readOnly: true,
                    placeholder: "Cliente",
                    icon: Icons.person_rounded,
                    onTap: handleCustomerClick,
                  ),
                  VoleepFormField(
                    minWidth: 550,
                    controller: vehicleNameController,
                    readOnly: true,
                    placeholder: "Veículo",
                    icon: Icons.drive_eta_rounded,
                    onTap: handleVehicleClick,
                  ),
                ],
              ),
              VoleepExpansionPanel("Itens", initiallyExpanded: true, children: [
                VoleepFormTile(
                  icon: Icons.playlist_add_rounded,
                  title: "Serviços",
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(serviceTotal.toString()),
                      const Icon(
                        Icons.navigate_next_rounded,
                      )
                    ],
                  ),
                  onTap: handleServiceClick,
                ),
                VoleepFormTile(
                  icon: Icons.add_shopping_cart_rounded,
                  title: "Produtos",
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("0.0"),
                      Icon(
                        Icons.navigate_next_rounded,
                      )
                    ],
                  ),
                  onTap: () =>
                      context.push(Routes.app.serviceOrder.productList),
                ),
                VoleepFormTile(
                  icon: Icons.percent_rounded,
                  title: "Desconto",
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("0"),
                      Icon(
                        Icons.navigate_next_rounded,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ]),
              VoleepExpansionPanel("Detalhes",
                  initiallyExpanded: true,
                  children: [
                    VoleepFormTile(
                      icon: Icons.attach_money_rounded,
                      title: "Meio de pagamento",
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.navigate_next_rounded,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ])
            ],
          ),
          onWillPop: () async {
            final canDeactivate = await showDialog(
              context: context,
              builder: (context) => const CanDeactivateDialog(),
            );
            return canDeactivate;
          },
        ),
      ),
    );
  }
}
