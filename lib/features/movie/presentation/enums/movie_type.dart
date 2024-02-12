import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';

enum MovieType {
  nowPlaying(),
  popular(),
  upcoming();

  const MovieType();

  String get title {
    switch (this) {
      case MovieType.nowPlaying:
        return 'In premiere'.hardCode;
      case MovieType.popular:
        return 'Popular'.hardCode;
      case MovieType.upcoming:
        return 'Upcoming'.hardCode;
    }
  }
}
