import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ServiceOrderItemListPage extends HookConsumerWidget {
  ServiceOrderItemListPage({super.key, this.modelList = const []});

  final List<ServiceOrderItemModel> modelList;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceLength = ref.watch(serviceOrderItemControllerProvider.select((value) => value.length));

    handleSelectService() async {
      final selectedService = await context.push(Routes.app.serviceOrder.selectService);
      if (selectedService != null && selectedService is List<ServiceModel>) {
        ref.read(serviceOrderItemControllerProvider.notifier).addServiceList(selectedService);
      }
    }

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (modelList.isEmpty) {
          handleSelectService();
        } else {
          ref.read(serviceOrderItemControllerProvider.notifier).setState(modelList);
        }
      });

      return () {};
    }, []);

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
                return ServiceOrderItemView(index: index);
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
