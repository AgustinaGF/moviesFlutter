import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_failure.freezed.dart';

@freezed
class SignInFailure with _$SignInFailure {
  factory SignInFailure.notFound() = _NotFound;
  factory SignInFailure.notVerified() = _SignFailureNotVerified;
  factory SignInFailure.network() = _Network;
  factory SignInFailure.unathorized() = _Unauthorized;
  factory SignInFailure.unknow() = _Unknown;
}
