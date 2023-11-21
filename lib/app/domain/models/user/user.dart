import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_flutter/app/domain/typedefs.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User(
      {required int id,
      required String username,
      @JsonKey(
        name: 'avatar',
        fromJson: avatarPathFromJson,
      )
      String? avatarPath}) = _User;

  String getFormatted() {
    return '$username $id';
  }

  factory User.fromJson(Json json) => _$UserFromJson(json);
}

String? avatarPathFromJson(Json json) {
  return json['tmdb']?['avatar_path'] as String?;
}
