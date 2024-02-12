class Routes {
  const Routes._({required this.name, required this.path});
  final String name;
  final String path;

  static Routes get auth => const Routes._(
        name: 'auth',
        path: '/auth',
      );

  static Routes get movies => const Routes._(
        name: 'movies',
        path: '/',
      );

  static Routes get search => const Routes._(
        name: 'search',
        path: 'search',
      );

  static Routes get movie => const Routes._(
        name: 'movie',
        path: 'movie/:id',
      );

  static Routes get seat => const Routes._(
        name: 'seat',
        path: '/seat',
      );

  static Routes get ticketPurchase => const Routes._(
        name: 'ticketPurchase',
        path: '/ticket-purchase',
      );
}
