import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';

class ServiceOrderSearchPage extends ConsumerWidget {
  const ServiceOrderSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(ServiceOrderRoutes.create);
            // if (shouldReload == true) {
            //   ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
            // }
          }),
    );
  }
}
