import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:filmflix/core/common/widgets/main_page.dart';
import 'package:filmflix/features/movies/presentation/pages/movies_page.dart';
import 'package:filmflix/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:filmflix/features/movies/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const String moviesPath = '/movies';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MoviesPage(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.popularMoviesRoute,
                path: popularMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularMoviesPage(),
                ),
              ),
              GoRoute(
                name: AppRoutes.topRatedMoviesRoute,
                path: topRatedMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TopRatedMoviesPage(),
                ),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
