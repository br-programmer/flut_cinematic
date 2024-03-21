import 'dart:io';

import 'package:flut_cinematic_api_client/flut_cinematic_api_client.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';

const _network = HttpRequestFailure.network();
const _unauthorized = HttpRequestFailure.unauthorized();
const _internalServer = HttpRequestFailure.internalServer();
const _serviceUnavailable = HttpRequestFailure.serviceUnavailable();
const _unhandledException = HttpRequestFailure.unhandledException();

FutureHttpRequest<T> performHttpRequest<T>(Future<HttpResult<T>> future) async {
  final result = await future;
  return switch (result) {
    HttpSuccess(statusCode: _, data: final data) => Either.right(data),
    HttpFailed(statusCode: _, error: final err) when err is SocketException =>
      const Either.left(_network),
    HttpFailed(statusCode: final statusCode) => switch (statusCode) {
        HttpStatus.unauthorized => const Either.left(_unauthorized),
        HttpStatus.internalServerError => const Either.left(_internalServer),
        HttpStatus.serviceUnavailable => const Either.left(_serviceUnavailable),
        _ => const Either.left(_unhandledException)
      },
  };
}
