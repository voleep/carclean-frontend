import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_controller.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ServiceOrderItemListPage extends HookConsumerWidget {
  ServiceOrderItemListPage({super.key, this.modelList = const []});

  final List<ServiceOrderItemModel> modelList;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceLength = ref.watch(
        serviceOrderItemControllerProvider.select((value) => value.length));

    handleSelectService() async {
      final selectedService =
          await context.push(Routes.app.serviceOrder.selectService);
      if (selectedService != null && selectedService is ServiceModel) {
        ref
            .read(serviceOrderItemControllerProvider.notifier)
            .addService(selectedService);
      }
    }

    useEffect(() {
      if (serviceLength == 0) {
        SchedulerBinding.instance
            .addPostFrameCallback((_) => handleSelectService());
      }

      return () {};
    }, []);

    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Serviços da OS"),
      ),
      body: ScrollableView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                itemCount: serviceLength,
                itemBuilder: (context, index) {
                  return ServiceOrderItemView(index: index);
                },
              ),
              VoleepButton(
                onPressed: handleSelectService,
                child: const Text("Adicionar serviço"),
              )
            ],
          ),
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
