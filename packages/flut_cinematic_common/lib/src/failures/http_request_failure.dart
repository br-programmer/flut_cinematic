import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

@freezed
sealed class HttpRequestFailure with _$HttpRequestFailure implements Exception {
  const factory HttpRequestFailure.unauthorized() = _Unauthorized;
  const factory HttpRequestFailure.internalServer() = _InternalServer;
  const factory HttpRequestFailure.serviceUnavailable() = _ServiceUnavailable;
  const factory HttpRequestFailure.unhandledException() = _UnhandledException;
  const factory HttpRequestFailure.network() = _Network;
}
