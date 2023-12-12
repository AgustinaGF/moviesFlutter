import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';

import '../models/media/media.dart';

abstract class TrendingRepository {
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  );
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers();
}
