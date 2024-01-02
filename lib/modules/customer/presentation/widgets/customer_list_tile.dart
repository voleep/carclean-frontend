import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({
    super.key,
    required this.item,
    required this.controller,
    required this.onEdit,
  });

  final CustomerModel item;

  final ListController<CustomerModel> controller;

  final FutureOr<void> Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: controller.selection
          ? ListenableBuilder(
              listenable: controller.selectionListenable,
              builder: (context, child) => Checkbox(
                value: controller.isSelected(item),
                onChanged: (_) => controller.toggle(item),
              ),
            )
          : null,
      trailing: controller.selection
          ? IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.surfaceVariant)),
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            )
          : null,
      title: Text(item.dsName),
      onTap: () => controller.selection ? controller.toggle(item) : onEdit(),
    );
  }
}
