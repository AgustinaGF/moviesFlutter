import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required int id,
      required String username,
      @JsonKey(
        name: 'avatar',
        fromJson: avatarPathFromJson,
      )
      required String? avatarPath}) = _User;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

String? avatarPathFromJson(Map<String, dynamic> json) {
  return json['tmdb']?['avatar_path'] as String?;
}
