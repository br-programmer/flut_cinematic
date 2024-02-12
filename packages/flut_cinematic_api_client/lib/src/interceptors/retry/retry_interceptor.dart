import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flut_cinematic_api_client/flut_cinematic_api_client.dart';

/// An interceptor that will try to send failed requests again
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required Dio dio,
    required bool enableLogging,
    RetryOptions? options,
  })  : _options = options ?? const RetryOptions(),
        _dio = dio,
        _enableLogging = enableLogging;

  final Dio _dio;
  final bool _enableLogging;
  final RetryOptions _options;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var extra = RetryOptions.fromExtra(err.requestOptions) ?? _options;
    final retryEvaluator = await _options.retryEvaluator(err);
    final shouldRetry = extra.retries > 0 && retryEvaluator;
    if (!shouldRetry) {
      return super.onError(err, handler);
    }

    if (extra.retryInterval.inMilliseconds > 0) {
      await Future<void>.delayed(extra.retryInterval);
    }

    extra = extra.copyWith(retries: extra.retries - 1);
    err.requestOptions.extra = err.requestOptions.extra
      ..addAll(extra.toExtra());
    if (_enableLogging) {
      log('👀 Retry request in ${err.response?.realUri}');
    }
    try {
      final response = await _dio.request<void>(
        err.requestOptions.path,
        cancelToken: err.requestOptions.cancelToken,
        data: err.requestOptions.data,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        onSendProgress: err.requestOptions.onSendProgress,
        queryParameters: err.requestOptions.queryParameters,
        options: err.requestOptions.toOptions(),
      );
      return handler.resolve(response);
    } catch (error) {
      return handler.reject(error as DioException);
    }
  }
}
