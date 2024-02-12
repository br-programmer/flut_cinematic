import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required String apiKey})
      : _queryParameters = {'api_key': apiKey};

  final Map<String, dynamic> _queryParameters;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll(_queryParameters);
    super.onRequest(options, handler);
  }
}
