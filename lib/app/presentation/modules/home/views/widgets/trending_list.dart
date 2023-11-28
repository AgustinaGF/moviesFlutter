import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:provider/provider.dart';

typedef EitherListMedia = Either<HttpRequestFailure, List<Media>>;

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendingRepository repository = context.read();

    return SizedBox(
      height: 250,
      child: Center(
        child: FutureBuilder<EitherListMedia>(
            future: repository.getMoviesAndSeries(TimeWindow.day),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text('Error');
              }
              return Text(
                snapshot.data?.toString() ?? 'empty data',
              );
            }),
      ),
    );
  }
}
