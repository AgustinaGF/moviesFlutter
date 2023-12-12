import 'package:movies_flutter/app/data/services/utils/handle_failure.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';
import 'package:movies_flutter/app/domain/typedefs.dart';

import '../../../domain/either/either.dart';
import '../../../domain/models/media/media.dart';
import '../../http/http.dart';

class TrendingAPI {
  final Http _http;

  TrendingAPI(this._http);

  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
    TimeWindow timeWindow,
  ) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSuccess: (json) {
        final list = List<Json>.from(json['results']);
        return list
            .where(
              (e) => e['media_type'] != 'person',
            )
            .map(
              (e) => Media.fromJson(e),
            )
            .toList();
      },
    );
    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }

  Future<Either<HttpRequestFailure, List<Performer>>> getPerformer(
    TimeWindow timeWindow,
  ) async {
    final result = await _http.request(
      '/trending/person/${timeWindow.name}',
      onSuccess: (json) {
        final list = List<Json>.from(json['results']);
        return list
            .where(
              (e) =>
                  e['know_for_department'] == 'Acting' &&
                  e['profile_path'] != null,
            )
            .map(
              (e) => Performer.fromJson(e),
            )
            .toList();
      },
    );
    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
