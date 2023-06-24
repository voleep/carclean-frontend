import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Filtros",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.close_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
