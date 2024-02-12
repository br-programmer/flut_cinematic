import 'package:flut_cinematic/core/core.dart';
import 'package:riverpod/riverpod.dart';

class StateNotifiers {
  const StateNotifiers._();

  static final bottonBar = StateNotifierProvider<
      ValueProvider<MoviesBottomBarStatus>, MoviesBottomBarStatus>(
    (ref) => ValueProvider(MoviesBottomBarStatus.movies),
  );
}
