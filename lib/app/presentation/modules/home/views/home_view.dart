import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_list.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/performers/trending_performers.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LayoutBuilder(
        builder: (_, constraints) => RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight,
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  TrendingList(),
                  SizedBox(
                    height: 20,
                  ),
                  TrendingPerformers()
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
