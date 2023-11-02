import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_menu_card.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_silver_appbar.dart';

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
        const VoleepSliverAppBar(
          titleSpacing: 24,
          title: Text("CarClean"),
          bottom: PreferredSize(
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
