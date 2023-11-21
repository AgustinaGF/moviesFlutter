import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  factory HttpRequestFailure.notFound() = HttpRequestFailureNotFound;
  factory HttpRequestFailure.network() = HttpRequestFailureNetWork;
  factory HttpRequestFailure.unathorized() = HttpRequestFailureUnauthorized;
  factory HttpRequestFailure.unknow() = HttpRequestFailureUnknown;
}
