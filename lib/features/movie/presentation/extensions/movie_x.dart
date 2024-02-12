import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';

extension MovieX on Movie {
  String get _baseImageUrl => const String.fromEnvironment('baseImageUrl');
  String get poster => '$_baseImageUrl/w780/$posterPath';
  String get backdrop => '$_baseImageUrl/w780/$backdropPath';
}
