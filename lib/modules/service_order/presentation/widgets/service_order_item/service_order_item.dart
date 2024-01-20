import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/text_editing_controller_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/widget_ref_extension.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/widgets/service_order_item/service_order_item_params.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/widgets/service_order_item/service_order_item_vm.dart';
import 'package:voleep_carclean_frontend/shared/formatters/real_input_formatter.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/row_wrap.dart';

class ServiceOrderItem extends ConsumerStatefulWidget {
  const ServiceOrderItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceOrderItemState();
}

class _ServiceOrderItemState extends ConsumerState<ServiceOrderItem> {
  final employeeEC = TextEditingController();
  final priceEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final params = serviceOrderItemParamsProvider;
    final uuid = ref.watch(params.select((p) => p.uuid));
    final soUuid = ref.watch(params.select((p) => p.soUuid));
    final provider = serviceOrderItemVmProvider(uuid, soUuid);
    final notifier = provider.notifier;

    ref.changed(provider.select((s) => s.employee), changeEmployee);
    ref.changed(provider.select((s) => s.price), changePrice);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          child: ExpansionTile(
            title: Consumer(builder: (context, ref, _) {
              final state = ref.watch(provider);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.service.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text("Valor: ${state.price}")
                ],
              );
            }),
            tilePadding: const EdgeInsets.symmetric(horizontal: 15),
            childrenPadding:
                const EdgeInsets.only(right: 5, bottom: 5, left: 5),
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
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
                "#",
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600),
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
                  child: RowWrap(children: [
                    VoleepFormField(
                      minWidth: 300,
                      controller: employeeEC,
                      readOnly: true,
                      placeholder: "Colaborador",
                      // suffixIcon: employeeEC.text.isNotEmpty
                      //     ? IconButton(
                      //         icon: const Icon(Icons.clear_rounded),
                      //         onPressed: () => ref.read(provider.notifier),
                      //       )
                      //     : null,
                      onTap: () => ref.read(notifier).selectEmployee(context),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: VoleepFormField(
                          minWidth: 120,
                          controller: priceEC,
                          placeholder: "Valor",
                          validator: Validators.required(),
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RealInputFormatter(moeda: true),
                          ],
                          onChanged: ref.read(notifier).changePrice,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 63,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: ref.read(notifier).removeSelf,
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

  changeEmployee(Employee? employee) {
    employeeEC.textOrEmpty = employee?.name;
  }

  changePrice(double price) {
    priceEC.textOrEmpty = price.toString();
  }

  @override
  void dispose() {
    employeeEC.dispose();
    priceEC.dispose();

    super.dispose();
  }
}
