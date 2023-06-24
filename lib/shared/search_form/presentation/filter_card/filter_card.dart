import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.title, required this.child});

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface), child: title),
            const SizedBox(
              height: 12,
            ),
            child
          ],
        ),
      ),
    );
  }
}
