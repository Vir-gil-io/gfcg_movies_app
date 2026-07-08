import 'package:gfcg_movies_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse( state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex,);
      },
      routes: [
        GoRoute(
          path: '/movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId,);
          },
        )
      ]
    )
  ]
);