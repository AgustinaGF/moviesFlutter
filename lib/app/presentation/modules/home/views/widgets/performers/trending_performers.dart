import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/performers/performer_tile.dart';
import 'package:provider/provider.dart';

typedef EitherListPerformer = Either<HttpRequestFailure, List<Performer>>;

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  late Future<EitherListPerformer> _future;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _future = context.read<TrendingRepository>().getPerformers();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<EitherListPerformer>(
        future: _future,
        builder: (_, snapshop) {
          if (!snapshop.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshop.data!.when(
            left: (_) => const Text('Error'),
            right: (list) => Stack(
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
                        final int currentCard =
                            _pageController.page?.toInt() ?? 0;
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
          );
        },
      ),
    );
  }
}
