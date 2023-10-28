import 'package:flutter/material.dart';

class VoleepSearchField extends StatelessWidget {
  const VoleepSearchField({
    super.key,
    this.margin,
    this.onChanged,
    this.onSubmitted,
  });

  final EdgeInsetsGeometry? margin;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: margin,
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          iconColor: Colors.black87,
          border: InputBorder.none,
          hintText: 'Pesquisar',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
      ),
    );
  }
}
