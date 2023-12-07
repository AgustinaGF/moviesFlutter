import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/widgets/trending_tile.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(
                'TRENDING',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              DropdownButton<TimeWindow>(
                value: TimeWindow.week,
                items: const [
                  DropdownMenuItem(
                    child: Text('Last 24hs'),
                    value: TimeWindow.day,
                  ),
                  DropdownMenuItem(
                    child: Text('Last week'),
                    value: TimeWindow.week,
                  )
                ],
                onChanged: (timeWindow) {
                  if (timeWindow != null) {
                    setState(() {
                      _timeWindow = timeWindow;
                      _future = _repository.getMoviesAndSeries(_timeWindow);
                    });
                  }
                },
              ),
            ],
          ),
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
                        left: (failure) => Text(
                          failure.toString(),
                        ),
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
