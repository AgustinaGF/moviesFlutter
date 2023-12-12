import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_flutter/app/domain/models/media/media.dart';

part 'performer.freezed.dart';
part 'performer.g.dart';

@freezed
class Performer with _$Performer {
  factory Performer({
    required int id,
    required String name,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'profile_path') required String profilePath,
    @JsonKey(
      name: 'know_for',
      fromJson: getMediaList,
    )
    required List<Media> knownFor,
  }) = _Performer;

  factory Performer.fromJson(Map<String, dynamic> json) =>
      _$PerformerFromJson(json);
}
