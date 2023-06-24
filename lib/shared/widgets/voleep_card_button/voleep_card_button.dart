import 'package:flutter/material.dart';

class VoleepCardButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String text;

  const VoleepCardButton({super.key, required this.icon, this.iconColor, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).colorScheme.onInverseSurface.withOpacity(0.4),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          shadowColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(
            width: 24,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.6),
                    ),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
