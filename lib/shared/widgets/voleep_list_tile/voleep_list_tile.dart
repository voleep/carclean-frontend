import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';

class VoleepListTile<T> extends StatelessWidget {
  const VoleepListTile({
    super.key,
    required this.title,
    required this.item,
    required this.controller,
    required this.onEdit,
    this.subtitle,
  });

  final String title;

  final T item;

  final ListController<T> controller;

  final FutureOr<void> Function(T item) onEdit;

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = subtitle != null;
    return ListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500)),
      subtitle: hasSubtitle ? Text(subtitle!) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: controller.selection
          ? ListenableBuilder(
              listenable: controller.selectionListenable,
              builder: (context, child) => SizedBox(
                width: 30,
                child: Checkbox(
                  value: controller.isSelected(item),
                  onChanged: (_) => controller.toggle(item),
                ),
              ),
            )
          : null,
      trailing: controller.selection
          ? IconButton(
              iconSize: 20,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.surface,
                ),
              ),
              icon: const Icon(Icons.edit),
              onPressed: () => onEdit(item),
            )
          : null,
      onTap: () =>
          controller.selection ? controller.toggle(item) : onEdit(item),
    );
  }
}
