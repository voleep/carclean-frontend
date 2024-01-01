import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';

class CustomerListTile extends ListTile {
  CustomerListTile({
    super.key,
    required CustomerModel item,
    required ListController<CustomerModel> controller,
    required FutureOr<void> Function() onEdit,
  }) : super(
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
                  icon: const Icon(Icons.edit_document),
                  onPressed: onEdit,
                )
              : null,
          title: Text(item.dsName),
          onTap: () =>
              controller.selection ? controller.toggle(item) : onEdit(),
        );
}
