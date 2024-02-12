import 'dart:io';

import 'package:flut_cinematic_api_client/flut_cinematic_api_client.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';

final _network = HttpRequestFailure.network();
final _unauthorized = HttpRequestFailure.unauthorized();
final _internalServer = HttpRequestFailure.internalServer();
final _serviceUnavailable = HttpRequestFailure.serviceUnavailable();
final _unhandledException = HttpRequestFailure.unhandledException();

FutureHttpRequest<T> performHttpRequest<T>(Future<HttpResult<T>> future) async {
  final result = await future;
  return switch (result) {
    HttpSuccess(statusCode: _, data: final data) => Either.right(data),
    HttpFailed(statusCode: _, error: final err) when err is SocketException =>
      Either.left(_network),
    HttpFailed(statusCode: final statusCode) => switch (statusCode) {
        HttpStatus.unauthorized => Either.left(_unauthorized),
        HttpStatus.internalServerError => Either.left(_internalServer),
        HttpStatus.serviceUnavailable => Either.left(_serviceUnavailable),
        _ => Either.left(_unhandledException)
      },
  };
}
