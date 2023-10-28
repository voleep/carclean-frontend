import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderItemView extends HookConsumerWidget {
  const ServiceOrderItemView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceDescription = useState("");
    final employeeController = useTextEditingController();
    final priceController = useTextEditingController();
    final servicePrice = useState("");

    ref.listenManual(serviceOrderItemControllerProvider.select((value) => value[index]), (prev, current) {
      serviceDescription.value = current.service.description;
      employeeController.text = current.employee?.name ?? '';
      priceController.text = UtilBrasilFields.obterReal(current.price);
      servicePrice.value = UtilBrasilFields.obterReal(current.price);
    }, fireImmediately: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          child: ExpansionTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceDescription.value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text("Valor: ${servicePrice.value}")
              ],
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 15),
            childrenPadding: const EdgeInsets.only(right: 5, bottom: 5, left: 5),
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            shape: const RoundedRectangleBorder(side: BorderSide.none),
            collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
            leading: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "${index + 1}",
                style:
                    TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 2.4),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 12, left: 12),
                  child: RowInline(children: [
                    VoleepTextFormField(
                      width: 300,
                      controller: employeeController,
                      readOnly: true,
                      placeholder: "Colaborador",
                      suffixIcon: employeeController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              onPressed: () =>
                                  ref.read(serviceOrderItemControllerProvider.notifier).handleRemoveEmployee(index),
                            )
                          : null,
                      onTap: () => ref.read(serviceOrderItemControllerProvider.notifier).handleSelectEmployee(index),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: VoleepTextFormField(
                          width: 120,
                          controller: priceController,
                          placeholder: "Valor",
                          validator: Validators.required,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter(moeda: true),
                          ],
                          onChanged: (value) {
                            final price = UtilBrasilFields.converterMoedaParaDouble(priceController.text);
                            ref.read(serviceOrderItemControllerProvider.notifier).handlePriceChanged(index, price);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 63,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () => ref.read(serviceOrderItemControllerProvider.notifier).removeService(index),
                            icon: Icon(
                              Icons.delete_rounded,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ))
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
