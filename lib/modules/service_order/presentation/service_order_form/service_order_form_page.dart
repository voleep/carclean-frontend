import 'package:brasil_fields/brasil_fields.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_expansion_panel/voleep_expansion_panel.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_tile/voleep_form_tile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderFormPage extends HookConsumerWidget {
  ServiceOrderFormPage({super.key, this.serviceOrderId, required this.mode});

  final ServiceOrderId? serviceOrderId;
  final FormMode mode;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = useState<CustomerModel?>(null);
    final customerNameController = useTextEditingController();

    final vehicle = useState<VehicleModel?>(null);
    final vehicleNameController = useTextEditingController();

    final serviceItemList = useState<List<ServiceOrderItemModel>>([]);

    final serviceTotal = serviceItemList.value.map((item) => item.price).sum;

    handleCustomerClick() {
      GoRouter.of(context).push(Routes.app.serviceOrder.selectCustomer).then((value) {
        if (value != null && value is CustomerModel) {
          //customer.value = selectedCustomer;
          customerNameController.text = value.dsName;
        }
      });
    }

    handleVehicleClick() {
      GoRouter.of(context).push(Routes.app.serviceOrder.selectVehicle).then((value) {
        if (value != null && value is VehicleModel) {
          //vehicle.value = selectedVehicle;
          vehicleNameController.text = value.description;
        }
      });
    }

    handleServiceClick() {
      context.push(Routes.app.serviceOrder.serviceList, extra: serviceItemList.value).then((value) {
        if (value != null && value is List<ServiceOrderItemModel>) {
          serviceItemList.value = value;
        }
      });
    }

    return Scaffold(
        appBar: const VoleepAppBar(
          title: Text("Ordem de serviço"),
        ),
        body: ScrollableView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RowInline(
                  children: [
                    VoleepTextFormField(
                      width: 550,
                      controller: customerNameController,
                      readOnly: true,
                      placeholder: "Cliente",
                      icon: Icons.person_rounded,
                      onTap: handleCustomerClick,
                    ),
                    VoleepTextFormField(
                      width: 550,
                      controller: vehicleNameController,
                      readOnly: true,
                      placeholder: "Veículo",
                      icon: Icons.drive_eta_rounded,
                      onTap: handleVehicleClick,
                    ),
                  ],
                ),
                VoleepExpansionPanel("Itens", children: [
                  VoleepFormTile(
                    icon: Icons.playlist_add_rounded,
                    title: "Serviços",
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(UtilBrasilFields.obterReal(serviceTotal)),
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(UtilBrasilFields.obterReal(0.0)),
                        const Icon(
                          Icons.navigate_next_rounded,
                        )
                      ],
                    ),
                    onTap: () => context.push(Routes.app.serviceOrder.productList),
                  ),
                  VoleepFormTile(
                    icon: Icons.percent_rounded,
                    title: "Desconto",
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(UtilBrasilFields.obterReal(0)),
                        const Icon(
                          Icons.navigate_next_rounded,
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ]),
                VoleepExpansionPanel("Detalhes", children: [
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
                builder: (context) => CanDeactivateDialog(),
              );
              return canDeactivate;
            },
          ),
        ));
  }
}
