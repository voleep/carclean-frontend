import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3),
          alignment: Alignment.center,
          child: const TextField(
            cursorHeight: 25,
            cursorRadius: Radius.circular(12),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
              border: InputBorder.none,
              hintText: 'Pesquisar',
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.search,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
