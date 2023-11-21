import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_failure.freezed.dart';

@freezed
class SignInFailure with _$SignInFailure {
  factory SignInFailure.notFound() = NotFound;
  factory SignInFailure.network() = Network;
  factory SignInFailure.unathorized() = Unauthorized;
  factory SignInFailure.unknow() = Unknown;
}
