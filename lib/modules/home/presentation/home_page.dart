import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_bar/voleep_sliver_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          VoleepSliverBar(
            title: 'CarClean',
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              )
            ],
          ),
        ],
        body: const Scrollbar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Em desenvolvimento..."),
            ],
          ),
        ),
      ),
    );
  }
}
