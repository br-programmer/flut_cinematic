import 'dart:io';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required String apiKey})
      : _queryParameters = {'api_key': apiKey};

  final Map<String, dynamic> _queryParameters;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language = Platform.localeName.substring(0, 2);
    options.queryParameters
      ..addAll(_queryParameters)
      ..addAll({'language': language});
    super.onRequest(options, handler);
  }
}
