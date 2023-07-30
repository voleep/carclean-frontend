import 'package:flutter/material.dart';

class VoleepSearchTile extends StatelessWidget {
  const VoleepSearchTile({
    super.key,
    required this.title,
    this.selected = false,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final String title;
  final bool selected;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = subtitle != null;
    return ListTile(
      tileColor: selected ? Theme.of(context).colorScheme.primaryContainer : null,
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
      subtitle: hasSubtitle ? Text(subtitle!) : null,
      leading: leading,
      trailing: trailing,
      contentPadding: const EdgeInsets.only(left: 10, right: 3),
    );
  }
}
