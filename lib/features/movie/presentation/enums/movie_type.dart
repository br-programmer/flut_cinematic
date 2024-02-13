import 'package:flut_cinematic/i18n/translations.g.dart';

enum MovieType {
  nowPlaying(),
  popular(),
  upcoming();

  const MovieType();

  String get title {
    switch (this) {
      case MovieType.nowPlaying:
        return texts.movie.inPremiere;
      case MovieType.popular:
        return texts.movie.popular;
      case MovieType.upcoming:
        return texts.movie.upcoming;
    }
  }
}
