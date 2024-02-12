import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class HttpResult<T> with _$HttpResult<T> {
  factory HttpResult.success(int statusCode, T data) = HttpSuccess<T>;
  factory HttpResult.failed(int? statusCode, Object? error) = HttpFailed<T>;
}
