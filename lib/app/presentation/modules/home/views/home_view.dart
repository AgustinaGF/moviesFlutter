import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/trending_list.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/trending_performers.dart';

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
    );
  }
}
