// ignore_for_file: parameter_assignments

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flut_cinematic_api_client/flut_cinematic_api_client.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';

export 'perform_http_request.dart';

enum HttpMethod { get, post, patch, put, delete }

class Http {
  Http({
    required Dio dio,
    required bool enableLogging,
  })  : _dio = dio,
        _enableLogging = enableLogging;

  final Dio _dio;
  final bool _enableLogging;
  CancelToken? _cancelToken;

  Future<HttpResult<T>> send<T>(
    String path, {
    required T Function(int statusCode, dynamic data) parser,
    HttpMethod method = HttpMethod.get,
    Json queryParameters = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
    String contentType = Headers.jsonContentType,
    bool autoDecodeReponse = true,
    Duration? receiveTimeout,
    bool cancel = false,
  }) async {
    int? statusCode;
    try {
      if (cancel) {
        _cancelToken?.cancel();
        _cancelToken = CancelToken();
      }
      final response = await _dio.request<dynamic>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          receiveTimeout: receiveTimeout,
          contentType: contentType,
          responseType: autoDecodeReponse ? null : ResponseType.bytes,
          method: method.name,
          headers: headers,
        ),
        cancelToken: _cancelToken,
      );
      if (_enableLogging) {
        log(
          const JsonEncoder.withIndent(' ').convert({
            'url': response.realUri.toString(),
            'headers': response.requestOptions.headers,
            'statusCode': response.statusCode,
            'body': body,
          }),
        );
      }

      statusCode = response.statusCode;
      final responseBody = response.data;
      _cancelToken = null;
      if (autoDecodeReponse && (responseBody is Map || responseBody is List)) {
        log(const JsonEncoder.withIndent(' ').convert(responseBody));
      }

      if (statusCode! >= HttpStatus.ok && statusCode < HttpStatus.badRequest) {
        return HttpResult.success(
          statusCode,
          parser(statusCode, responseBody),
        );
      }
      return HttpResult.failed(statusCode, responseBody);
    } on DioException catch (e) {
      if (_enableLogging) {
        log(
          const JsonEncoder.withIndent(' ').convert({
            'url': e.requestOptions.uri.toString(),
            'headers': e.requestOptions.headers,
            'method': e.requestOptions.method,
            'request body': e.requestOptions.data,
            'response body': e.response?.data,
            'statusCode': e.response?.statusCode,
            'message': e.message,
          }),
          stackTrace: e.stackTrace,
        );
      }
      _cancelToken = null;
      return HttpResult.failed(e.response?.statusCode, e.response?.data);
    } catch (e, s) {
      if (_enableLogging) {
        log(e.toString(), stackTrace: s);
      }
      _cancelToken = null;
      return HttpResult.failed(statusCode, e);
    }
  }
}
