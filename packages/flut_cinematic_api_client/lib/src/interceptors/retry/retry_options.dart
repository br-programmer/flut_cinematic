import 'dart:async';

import 'package:dio/dio.dart';

extension RequestOptionsExtensions on RequestOptions {
  Options toOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}

typedef RetryEvaluator = FutureOr<bool> Function(DioException error);

class RetryOptions {
  const RetryOptions({
    this.retries = 3,
    RetryEvaluator? retryEvaluator,
    this.retryInterval = const Duration(seconds: 1),
  }) : _retryEvaluator = retryEvaluator;

  factory RetryOptions.noRetry() => const RetryOptions(retries: 0);

  final int retries;
  final Duration retryInterval;
  final RetryEvaluator? _retryEvaluator;

  static const extraKey = 'cache_retry_request';

  RetryEvaluator get retryEvaluator => _retryEvaluator ?? defaultRetryEvaluator;

  static FutureOr<bool> defaultRetryEvaluator(DioException error) =>
      error.type != DioExceptionType.cancel &&
      error.type != DioExceptionType.badResponse;

  static RetryOptions? fromExtra(RequestOptions request) =>
      request.extra[extraKey] as RetryOptions?;

  RetryOptions copyWith({int? retries, Duration? retryInterval}) {
    return RetryOptions(
      retries: retries ?? this.retries,
      retryInterval: retryInterval ?? this.retryInterval,
    );
  }

  Map<String, dynamic> toExtra() => {extraKey: this};

  Options toOptions() => Options(extra: toExtra());

  Options mergeIn(Options options) => options.copyWith(
        extra: <String, dynamic>{}
          ..addAll(options.extra ?? {})
          ..addAll(toExtra()),
      );
}
