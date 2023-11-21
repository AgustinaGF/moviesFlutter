import 'package:movies_flutter/app/data/services/utils/handle_failure.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
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
      '/trending/{media_type}/${timeWindow.name}',
      onSuccess: (json) {
        final list = json['results'] as List<Json>;

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
}
