import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/global/widgets/request_failed.dart';
import 'package:movies_flutter/app/presentation/modules/home/controller/home_controller.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/performers/performer_tile.dart';
import 'package:provider/provider.dart';

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final performers = controller.state.performers;
    return Expanded(
      child: performers.when(
        loading: () => Center(
          child: const CircularProgressIndicator(),
        ),
        failed: () => RequestFailed(onRetry: () {}),
        loaded: (list) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final performer = list[index];
                return PerformerTile(performer: performer);
              },
            ),
            Positioned(
              bottom: 30,
              child: AnimatedBuilder(
                  animation: _pageController,
                  builder: (_, __) {
                    final int currentCard = _pageController.page?.toInt() ?? 0;
                    return Row(
                      children: List.generate(
                          list.length,
                          (index) => Icon(
                                Icons.circle,
                                size: 14,
                                color: currentCard == index
                                    ? Colors.blue
                                    : Colors.white30,
                              )),
                    );
                  }),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
