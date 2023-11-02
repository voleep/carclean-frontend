import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/shared/formatters/real_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/utils/field_util.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/row_inline/row_inline.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class ServiceOrderItem extends ConsumerStatefulWidget {
  const ServiceOrderItem({super.key, required this.index});

  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServiceOrderItemState();
}

class _ServiceOrderItemState extends ConsumerState<ServiceOrderItem> {
  final _employeeController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listenManual(serviceOrderItemControllerProvider.select((value) => value[widget.index]), (prev, current) {
      _employeeController.text = current.employee?.name ?? '';
      _priceController.text = current.price.toString();
    }, fireImmediately: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          child: ExpansionTile(
            title: Consumer(builder: (context, ref, _) {
              final service = ref.watch(serviceOrderItemControllerProvider.select((value) => value[widget.index]));
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.service.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text("Valor: ${service.price}")
                ],
              );
            }),
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
                "${widget.index + 1}",
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
                      controller: _employeeController,
                      readOnly: true,
                      placeholder: "Colaborador",
                      suffixIcon: _employeeController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              onPressed: () => ref
                                  .read(serviceOrderItemControllerProvider.notifier)
                                  .handleRemoveEmployee(widget.index),
                            )
                          : null,
                      onTap: () =>
                          ref.read(serviceOrderItemControllerProvider.notifier).handleSelectEmployee(widget.index),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: VoleepTextFormField(
                          width: 120,
                          controller: _priceController,
                          placeholder: "Valor",
                          validator: Validators.required(),
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RealInputFormatter(moeda: true),
                          ],
                          onChanged: (value) {
                            final price = FieldUtil.realToDouble(_priceController.text);
                            ref
                                .read(serviceOrderItemControllerProvider.notifier)
                                .handlePriceChanged(widget.index, price);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 63,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () =>
                                ref.read(serviceOrderItemControllerProvider.notifier).removeService(widget.index),
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
