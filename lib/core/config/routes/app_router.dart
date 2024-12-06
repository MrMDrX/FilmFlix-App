import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:filmflix/core/common/widgets/main_page.dart';
import 'package:filmflix/features/movies/presentation/pages/movie_details_page.dart';
import 'package:filmflix/features/movies/presentation/pages/movies_page.dart';
import 'package:filmflix/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:filmflix/features/movies/presentation/pages/top_rated_movies_page.dart';
import 'package:filmflix/features/shows/presentation/pages/popular_shows_page.dart';
import 'package:filmflix/features/shows/presentation/pages/top_rated_shows_page.dart';
import 'package:filmflix/features/shows/presentation/pages/shows_page.dart';

const String moviesPath = '/movies';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String movieDetailsPath = 'movieDetails/:movieId';

const String tvShowsPath = '/tvShows';
const String popularTVShowsPath = 'popularTVShows';
const String topRatedTVShowsPath = 'topRatedTVShows';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          // Movies
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
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: MovieDetailsPage(
                    movieId: int.parse(state.pathParameters['movieId']!),
                  ),
                ),
              ),
            ],
          ),

          // TV Shows
          GoRoute(
            name: AppRoutes.tvShowsRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TVShowsPage(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.popularTvShowsRoute,
                path: popularTVShowsPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularTVShowsPage(),
                ),
              ),
              GoRoute(
                name: AppRoutes.topRatedTvShowsRoute,
                path: topRatedTVShowsPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TopRatedTVShowsPage(),
                ),
              ),
            ],
          )
        ],
      )
    ],
  );
}
