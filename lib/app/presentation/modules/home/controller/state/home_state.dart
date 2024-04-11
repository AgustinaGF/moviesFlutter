import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_flutter/app/domain/enums.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.loading(TimeWindow timeWindow) = HomeStateLoading;
  factory HomeState.failed(TimeWindow timeWindow) = HomeStateFailed;
  factory HomeState.loaded({
    required TimeWindow timeWindow,
    required List<Media> moviesAndSeries,
  }) = HomeStateLoaded;
}
