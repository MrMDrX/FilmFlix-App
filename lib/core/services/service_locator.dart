import 'package:filmflix/features/movies/data/repository/movies_repository_impl.dart';
import 'package:filmflix/features/movies/data/source/movies_remote_source.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';
import 'package:filmflix/features/movies/domain/usecases/get_all_popular_movies_usecase.dart';
import 'package:filmflix/features/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:filmflix/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:filmflix/features/movies/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:filmflix/features/movies/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Sources
    sl.registerLazySingleton<MoviesRemoteSource>(
        () => MoviesRemoteSourceImpl());

    // Repositories
    sl.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));

    // Blocs
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
  }
}
