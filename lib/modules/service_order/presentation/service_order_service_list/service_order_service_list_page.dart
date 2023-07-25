import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ServiceOrderServiceListPage extends StatefulHookConsumerWidget {
  const ServiceOrderServiceListPage({super.key, this.serviceList = const []});

  final List<ServiceModel> serviceList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceOrderServiceState();
}

class _ServiceOrderServiceState
    extends ConsumerState<ServiceOrderServiceListPage> {
  @override
  Widget build(BuildContext context) {
    final serviceList = useState(widget.serviceList);

    handleSelectService() async {
      final selectedService =
          await context.push(Routes.app.serviceOrder.selectService);
      if (selectedService != null && selectedService is ServiceModel) {
        serviceList.value = [...serviceList.value, selectedService];
      }
    }

    useEffect(() {
      if (serviceList.value.isEmpty) {
        SchedulerBinding.instance
            .addPostFrameCallback((_) => handleSelectService());
      }

      return () {};
    }, []);

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
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: serviceList.value.length,
              itemBuilder: (context, index) {
                final service = serviceList.value[index];
                return ListTile(
                  title: Text(service.description),
                );
              },
            ),
            VoleepButton(
              onPressed: handleSelectService,
              child: const Text("Adicionar serviço"),
            )
          ],
        ),
      ),
    );
  }
}
