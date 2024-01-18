import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_items_page/service_order_items_vm.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/widgets/service_order_item/service_order_item.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/widgets/service_order_item/service_order_item_params.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';

class ServiceOrderItemsPage extends ConsumerStatefulWidget {
  const ServiceOrderItemsPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceOrderItemsPageState();
}

class _ServiceOrderItemsPageState extends ConsumerState<ServiceOrderItemsPage> {
  @override
  void initState() {
    super.initState();
    final provider = serviceOrderItemsVmProvider(widget.id);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (ref.read(provider).isEmpty) {
        ref.read(provider.notifier).selectServices(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = serviceOrderItemsVmProvider(widget.id);
    final itemsSize = ref.watch(provider.select((value) => value.length));

    return Scaffold(
      appBar: const VoleepAppBar(title: Text('Serviços')),
      body: ListView.builder(
        itemCount: itemsSize,
        itemBuilder: (context, index) {
          final state = ref.read(provider.select((value) => value[index]));
          return ProviderScope(
            overrides: [
              serviceOrderItemParamsProvider
                  .overrideWithValue(ServiceOrderItemParams(
                uuid: state.uuid,
                soUuid: widget.id,
              )),
            ],
            child: const ServiceOrderItem(),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: selectServices,
            child: const Icon(Icons.add_rounded),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: FloatingActionButton.extended(
              label: const Text("Confirmar"),
              onPressed: goBack,
            ),
          ),
        ],
      ),
    );
  }

  selectServices() {
    final notifier = serviceOrderItemsVmProvider(widget.id).notifier;
    ref.read(notifier).selectServices(context);
  }

  goBack() {
    context.pop();
  }
}
