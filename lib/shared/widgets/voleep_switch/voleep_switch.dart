import 'package:flutter/material.dart';

class VoleepSwitch extends StatelessWidget {
  const VoleepSwitch({
    super.key,
    required this.title,
    required this.valueNotifier,
  });

  final String title;

  final ValueNotifier<bool> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, situation, widget) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$title ",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.outline),
              ),
              Switch(
                value: situation,
                onChanged: (value) => valueNotifier.value = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
