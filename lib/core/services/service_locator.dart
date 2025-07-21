import 'package:filmflix/features/movies/data/repository/movies_repository_impl.dart';
import 'package:filmflix/features/movies/data/source/movies_remote_source.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';
import 'package:filmflix/features/movies/domain/usecases/get_all_popular_movies_usecase.dart';
import 'package:filmflix/features/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:filmflix/features/movies/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:filmflix/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:filmflix/features/movies/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:filmflix/features/movies/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:filmflix/features/search/data/repository/search_repository_impl.dart';
import 'package:filmflix/features/search/data/source/search_remote_source.dart';
import 'package:filmflix/features/search/domain/repository/search_repository.dart';
import 'package:filmflix/features/search/domain/usecases/search_usecase.dart';
import 'package:filmflix/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:filmflix/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:filmflix/features/shows/data/repository/shows_repository_impl.dart';
import 'package:filmflix/features/shows/data/source/shows_remote_source.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';
import 'package:filmflix/features/shows/domain/usecases/get_all_popular_shows_usecase.dart';
import 'package:filmflix/features/shows/domain/usecases/get_all_top_rated_shows_usecase.dart';
import 'package:filmflix/features/shows/domain/usecases/get_season_details_usecase.dart';
import 'package:filmflix/features/shows/domain/usecases/get_show_details_usecase.dart';
import 'package:filmflix/features/shows/domain/usecases/get_shows_usecase.dart';
import 'package:filmflix/features/shows/presentation/bloc/popular_shows_bloc/popular_shows_bloc.dart';
import 'package:filmflix/features/shows/presentation/bloc/show_details_bloc/show_details_bloc.dart';
import 'package:filmflix/features/shows/presentation/bloc/shows_bloc/shows_bloc.dart';
import 'package:filmflix/features/shows/presentation/bloc/top_rated_shows_bloc/top_rated_shows_bloc.dart';
import 'package:filmflix/features/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:filmflix/features/watchlist/data/source/watchlist_local_source.dart';
import 'package:filmflix/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:filmflix/features/watchlist/domain/usecases/add_watchlist_item_usecase.dart';
import 'package:filmflix/features/watchlist/domain/usecases/check_if_item_added_usecase.dart';
import 'package:filmflix/features/watchlist/domain/usecases/get_watchlist_items_usecase.dart';
import 'package:filmflix/features/watchlist/domain/usecases/remove_watchlist_item_usecase.dart';
import 'package:filmflix/features/watchlist/presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Sources
    sl.registerLazySingleton<MoviesRemoteSource>(
        () => MoviesRemoteSourceImpl());

    sl.registerLazySingleton<TVShowsRemoteSource>(
        () => TVShowsRemoteSourceImpl());

    sl.registerLazySingleton<SearchRemoteSource>(
        () => SearchRemoteSourceImpl());

    sl.registerLazySingleton<WatchlistLocalSource>(
        () => WatchlistLocalSourceImpl());

    // Repositories
    sl.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(sl()));

    sl.registerLazySingleton<TVShowsRepository>(
        () => TVShowsRepositoryImpl(sl()));

    sl.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(sl()));

    sl.registerLazySingleton<WatchlistRepository>(
        () => WatchListRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));

    sl.registerLazySingleton(() => GetTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetTVShowDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSeasonDetailsUseCase(sl()));

    sl.registerLazySingleton(() => SearchUseCase(sl()));

    sl.registerLazySingleton(() => GetWatchlistItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfItemAddedUseCase(sl()));

    // Blocs
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));

    sl.registerFactory(() => TVShowsBloc(sl()));
    sl.registerFactory(() => PopularTVShowsBloc(sl()));
    sl.registerFactory(() => TopRatedTVShowsBloc(sl()));
    sl.registerFactory(() => TVShowDetailsBloc(sl(), sl()));

    sl.registerFactory(() => SearchBloc(sl()));

    sl.registerFactory(() => WatchlistBloc(sl(), sl(), sl(), sl()));

    sl.registerFactory(() => ThemeCubit());
  }
}
