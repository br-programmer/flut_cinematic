class APIPaths {
  const APIPaths._();

  static const _version = '/3';
  static String movie(int id) => '$_version/movie/$id';
  static const String nowPlaying = '$_version/movie/now_playing';
  static const String popular = '$_version/movie/popular';
  static const String upcoming = '$_version/movie/upcoming';
  static const String search = '$_version/search/movie';
  static String videos(int id) => '${movie(id)}/videos';
}
