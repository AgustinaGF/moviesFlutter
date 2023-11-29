import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/global/utils/get_image_url.dart';
import 'package:provider/provider.dart';

typedef EitherListMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  late final Future<EitherListMedia> _future;

  @override
  void initState() {
    super.initState();
    final TrendingRepository repository = context.read();
    _future = repository.getMoviesAndSeries(TimeWindow.day);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: FutureBuilder<EitherListMedia>(
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final media = list[index];
                      return Image.network(
                        getImageUrl(media.posterPath),
                      );
                    },
                    itemCount: list.length,
                  );
                },
              );
            }),
      ),
    );
  }
}
