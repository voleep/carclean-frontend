import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';

class ServiceOrderProductListPage extends HookConsumerWidget {
  const ServiceOrderProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Produtos da OS"),
      ),
    );
  }
}
