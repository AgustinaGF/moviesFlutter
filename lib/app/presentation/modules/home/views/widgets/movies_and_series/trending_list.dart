import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/presentation/global/widgets/request_failed.dart';
import 'package:movies_flutter/app/presentation/modules/home/controller/home_controller.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_tile.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_time_window.dart';
import 'package:provider/provider.dart';

import '../../../../../../domain/either/either.dart';

typedef EitherListMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrendingTimeWindow(
          timeWindow: controller.state.timeWindow,
          onChanged: (timeWindow) {},
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: LayoutBuilder(
            builder: (_, contraints) {
              final width = contraints.maxHeight * 0.65;
              return Center(
                child: controller.state.loading
                    ? CircularProgressIndicator()
                    : controller.state.moviesAndSeries == null
                        ? RequestFailed(onRetry: () {})
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              final media =
                                  controller.state.moviesAndSeries![index];
                              return TrendingTile(
                                media: media,
                                width: width,
                              );
                            },
                            itemCount: controller.state.moviesAndSeries!.length,
                            separatorBuilder: (_, __) => SizedBox(
                              width: 10,
                            ),
                          ),
              );
            },
          ),
        ),
      ],
    );
  }
}
