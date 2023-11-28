import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/trending_list.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [TrendingList()],
        ),
      ),
    );
  }
}
