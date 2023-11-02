import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ServiceOrderItemListPage extends ConsumerStatefulWidget {
  const ServiceOrderItemListPage({super.key, this.modelList = const []});

  final List<ServiceOrderItemModel> modelList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServiceOrderItemListPageState();
}

class _ServiceOrderItemListPageState extends ConsumerState<ServiceOrderItemListPage> {
  final _formKey = GlobalKey<FormState>();

  handleSelectService() async {
    final selectedService = await context.push(Routes.app.serviceOrder.selectService);
    if (selectedService != null && selectedService is List<ServiceModel>) {
      ref.read(serviceOrderItemControllerProvider.notifier).addServiceList(selectedService);
    }
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.modelList.isEmpty) {
        handleSelectService();
      } else {
        ref.read(serviceOrderItemControllerProvider.notifier).setState(widget.modelList);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final serviceLength = ref.watch(serviceOrderItemControllerProvider.select((value) => value.length));

    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Serviços da OS"),
      ),
      body: ScrollableView(
        padding: const EdgeInsets.only(top: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...Iterable.generate(serviceLength).mapIndexed((_, index) {
                return ServiceOrderItem(index: index);
              }).toList(),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 12, bottom: 50, left: 12),
                child: VoleepButton(
                  onPressed: handleSelectService,
                  child: const Text(
                    "ADICIONAR SERVIÇO",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          onWillPop: () async => await showDialog(context: context, builder: (context) => const CanDeactivateDialog()),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            context.pop(ref.read(serviceOrderItemControllerProvider));
          }
        },
        label: const Text("Salvar"),
        icon: const Icon(Icons.done_rounded),
      ),
    );
  }
}
