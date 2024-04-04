import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/global/widgets/request_failed.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_tile.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/movies_and_series/trending_time_window.dart';
import 'package:provider/provider.dart';

import '../../../../../../domain/either/either.dart';

typedef EitherListMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  TrendingRepository get _repository => context.read();
  late Future<EitherListMedia> _future;
  TimeWindow _timeWindow = TimeWindow.day;
  @override
  void initState() {
    super.initState();
    _future = _repository.getMoviesAndSeries(_timeWindow);
  }

  void _updateFuture(TimeWindow timeWindow) {
    setState(() {
      _timeWindow = timeWindow;
      _future = _repository.getMoviesAndSeries(_timeWindow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrendingTimeWindow(
          timeWindow: _timeWindow,
          onChanged: _updateFuture,
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: LayoutBuilder(
            builder: (_, contraints) {
              final width = contraints.maxHeight * 0.65;
              return Center(
                child: FutureBuilder<EitherListMedia>(
                    key: ValueKey(_future),
                    future: _future,
                    builder: (_, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      return snapshot.data!.when(
                        left: (failure) => RequestFailed(onRetry: () {
                          _updateFuture(_timeWindow);
                        }),
                        right: (list) {
                          return ListView.separated(
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
                          );
                        },
                      );
                    }),
              );
            },
          ),
        ),
      ],
    );
  }
}
