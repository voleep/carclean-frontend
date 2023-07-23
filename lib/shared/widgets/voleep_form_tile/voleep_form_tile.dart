import 'package:flutter/material.dart';

class VoleepFormTile extends StatelessWidget {
  const VoleepFormTile(
      {super.key, this.icon, required this.title, this.trailing, this.onTap});

  final IconData? icon;
  final String title;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: icon != null
            ? Icon(
                icon,
                size: 25,
                color: Theme.of(context).colorScheme.outline,
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.2,
          ),
        ),
        trailing: trailing,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        tileColor: Theme.of(context).colorScheme.outline.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
