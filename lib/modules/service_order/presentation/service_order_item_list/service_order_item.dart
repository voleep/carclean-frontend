import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderItemView extends HookConsumerWidget {
  const ServiceOrderItemView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceController = useTextEditingController();
    final employeeController = useTextEditingController();
    final priceController = useTextEditingController();

    useEffect(() {
      return () {
        var doubleRE = RegExp(r"\b\d[\d,.]*\b");

        final price = priceController.text.isNotEmpty
            ? double.parse(doubleRE.firstMatch(priceController.text)!.group(0)!)
            : 0.0;
        ref
            .read(serviceOrderItemControllerProvider.notifier)
            .handlePriceChanged(index, price);
      };
    }, []);

    ref.listenManual(
        serviceOrderItemControllerProvider.select((value) => value[index]),
        (prev, current) {
      serviceController.text = current.service.description;
      employeeController.text = current.employee?.name ?? '';
      priceController.text = "R\$ ${current.price.toStringAsFixed(2)}";
    }, fireImmediately: true);

    handleEmployeeClick() {
      context.push(Routes.app.serviceOrder.selectEmployee).then((value) {
        if (value != null && value is EmployeeModel) {
          ref
              .read(serviceOrderItemControllerProvider.notifier)
              .handleEmployeeChanged(index, value);
        }
      });
    }

    return RowInline(children: [
      VoleepTextFormField(
        width: 550,
        controller: serviceController,
        readOnly: true,
        placeholder: "Serviço",
        validator: Validators.required,
      ),
      VoleepTextFormField(
        width: 300,
        controller: employeeController,
        readOnly: true,
        placeholder: "Colaborador",
        onTap: handleEmployeeClick,
      ),
      VoleepTextFormField(
        width: 120,
        controller: priceController,
        placeholder: "Valor",
        validator: Validators.required,
      )
    ]);
  }
}
