import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class ServiceOrderSearchPage extends HookConsumerWidget {
  const ServiceOrderSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload =
                await context.push(Routes.app.serviceOrder.create);
            // if (shouldReload == true) {
            //   ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
            // }
          }),
    );
  }
}
