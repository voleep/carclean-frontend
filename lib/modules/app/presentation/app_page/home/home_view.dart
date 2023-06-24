import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_menu_card.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_silver_appbar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, _) => [
        VoleepSliverAppBar(
          titleSpacing: 24,
          title: AnimatedTextKit(
            pause: const Duration(milliseconds: 0),
            isRepeatingAnimation: false,
            animatedTexts: [
              ColorizeAnimatedText(
                colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primaryContainer],
                textStyle: const TextStyle(fontSize: 20),
                'CarClean',
              ),
            ],
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Divider(
              height: 1,
            ),
          ),
          snap: true,
          floating: true,
        )
      ],
      body: Container(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: const SingleChildScrollView(
          child: Column(
            children: [HomeMenuCard()],
          ),
        ),
      ),
    );
  }
}
