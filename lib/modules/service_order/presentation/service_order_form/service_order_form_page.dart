import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';

class ServiceOrderFormPage extends HookConsumerWidget {
  const ServiceOrderFormPage(
      {super.key, this.serviceOrderId, required this.mode});

  final ServiceOrderId? serviceOrderId;
  final FormMode mode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: VoleepAppBar(
          title: Text("Ordem de serviço"),
        ),
        body: Center(
          child: Text("Em desenvolvimento"),
        ));
  }
}
