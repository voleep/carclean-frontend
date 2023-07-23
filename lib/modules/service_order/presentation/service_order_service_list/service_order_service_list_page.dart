import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ServiceOrderServiceListPage extends HookConsumerWidget {
  const ServiceOrderServiceListPage({super.key, this.serviceList = const []});

  final List<ServiceModel> serviceList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Serviços da OS"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
                visible: serviceList.isNotEmpty,
                child: ListView.builder(
                  itemCount: serviceList.length,
                  itemBuilder: (context, index) {
                    final service = serviceList[index];
                    return ListTile(
                      title: Text(service.description),
                    );
                  },
                )),
            VoleepButton(
              onPressed: () =>
                  context.push(Routes.app.serviceOrder.selectService),
              child: const Text("Adicionar serviço"),
            )
          ],
        ),
      ),
    );
  }
}
