import 'package:flut_cinematic/lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: Routes.movies.path,
      routes: AppRouter.routes,
    );
  },
);

class AppRouter {
  const AppRouter._();

  static List<GoRoute> get routes => [
        GoRoute(
          path: Routes.auth.path,
          name: Routes.auth.name,
          builder: LoginScreen.builder,
        ),
        GoRoute(
          path: Routes.movies.path,
          name: Routes.movies.name,
          builder: MoviesScreen.builder,
          routes: [
            GoRoute(
              path: Routes.search.path,
              name: Routes.search.name,
              builder: SearchMoviesScreen.builder,
            ),
            GoRoute(
              path: Routes.movie.path,
              name: Routes.movie.name,
              builder: MovieScreen.builder,
            ),
          ],
        ),
        GoRoute(
          path: Routes.seat.path,
          name: Routes.seat.name,
          builder: SeatScreen.builder,
        ),
        GoRoute(
          path: Routes.ticketPurchase.path,
          name: Routes.ticketPurchase.name,
          builder: PurchaseScreen.builder,
        ),
      ];
}
