import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';

class DataPaginationView extends StatelessWidget {
  const DataPaginationView({
    super.key,
    required this.pageData,
    required this.onPageChanged,
  });

  final PaginationModel<Map<String, dynamic>> pageData;
  final Function(int page) onPageChanged;

  String _getCurrentItems() {
    final totalItems = pageData.numberOfItems;
    final finalItem = (pageData.currentPage * 20);
    final initialItem = finalItem - 19;

    return "$initialItem - ${finalItem <= totalItems ? finalItem : totalItems}";
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pageData.currentPage;
    final numberOfPages = pageData.numberOfPages;
    final numberOfItems = pageData.numberOfItems;

    final showPrevIcon = currentPage > 1;
    final showNextIcon = currentPage < numberOfPages;

    return Row(
      children: [
        IconButton(onPressed: showPrevIcon ? () => onPageChanged(currentPage - 1) : null, icon: const Icon(Icons.navigate_before_rounded)),
        ...List<int>.generate(pageData.numberOfPages, (i) => i + 1).asMap().entries.map((entry) {
          final isSelected = entry.key + 1 == pageData.currentPage;

          if (entry.key == 5) {
            return IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded));
          }

          return IconButton(
            onPressed: () => onPageChanged(entry.key + 1),
            icon: Text(
              "${entry.key + 1}",
              style: TextStyle(
                color: isSelected ? Theme.of(context).colorScheme.tertiary : null,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
        IconButton(
          onPressed: showNextIcon ? () => onPageChanged(currentPage + 1) : null,
          icon: const Icon(Icons.navigate_next_rounded),
        ),
        const SizedBox(width: 35),
        Text("${_getCurrentItems()} de $numberOfItems registros")
      ],
    );
  }
}
