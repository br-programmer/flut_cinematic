import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

@freezed
sealed class HttpRequestFailure with _$HttpRequestFailure implements Exception {
  factory HttpRequestFailure.unauthorized() = _Unauthorized;
  factory HttpRequestFailure.internalServer() = _InternalServer;
  factory HttpRequestFailure.serviceUnavailable() = _ServiceUnavailable;
  factory HttpRequestFailure.unhandledException() = _UnhandledException;
  factory HttpRequestFailure.network() = _Network;
}
