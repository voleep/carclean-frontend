import 'package:flutter/material.dart';

class VoleepCard extends StatelessWidget {
  final Widget child;
  const VoleepCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customizar tela inicial",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            child
          ],
        ),
      ),
    );
  }
}
