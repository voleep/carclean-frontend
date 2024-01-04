import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_card/voleep_card.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_card_button/voleep_card_button.dart';

class HomeMenuCard extends ConsumerWidget {
  const HomeMenuCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      width: double.infinity,
      child: VoleepCard(
        child: Column(
          children: [
            VoleepCardButton(
              icon: Icons.widgets_rounded,
              title: "Customizar menús",
              text: "Adicione menús e outros detalhes de acordo com a sua marca.",
            ),
            SizedBox(
              height: 12,
            ),
            VoleepCardButton(
              icon: Icons.insights_rounded,
              iconColor: Colors.purple,
              title: "Customizar relatórios",
              text: "Adicione gráficos e outros relatórios conforme a sua necessidade.",
            )
          ],
        ),
      ),
    );
  }
}
