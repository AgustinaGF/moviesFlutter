import 'package:movies_flutter/app/data/services/remote/trending_api.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  TrendingRepositoryImpl(this._trendingAPI);
  final TrendingAPI _trendingAPI;

  @override
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  ) {
    return _trendingAPI.getMoviesAndSeries(timeWindow);
  }

  @override
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers() {
    return _trendingAPI.getPerformer(TimeWindow.day);
  }
}
