import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/global/widgets/request_failed.dart';
import 'package:movies_flutter/app/presentation/modules/home/controller/home_controller.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_tile.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_time_window.dart';
import 'package:provider/provider.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final moviesAndSeries = controller.state.moviesAndSeries;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrendingTimeWindow(
          timeWindow: moviesAndSeries.timeWindow,
          onChanged: (timeWindow) {},
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: LayoutBuilder(
            builder: (_, contraints) {
              final width = contraints.maxHeight * 0.65;
              return Center(
                child: moviesAndSeries.when(
                    loading: (_) => const CircularProgressIndicator(),
                    failed: (_) => RequestFailed(onRetry: () {}),
                    loaded: (
                      _,
                      list,
                    ) =>
                        ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final media = list[index];
                            return TrendingTile(
                              media: media,
                              width: width,
                            );
                          },
                          itemCount: list.length,
                          separatorBuilder: (_, __) => SizedBox(
                            width: 10,
                          ),
                        )),
              );
            },
          ),
        ),
      ],
    );
  }
}
