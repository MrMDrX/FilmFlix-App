import 'package:filmflix/features/movies/data/repository/movies_repository_impl.dart';
import 'package:filmflix/features/movies/data/source/movies_remote_source.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:filmflix/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
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

    // Blocs
    sl.registerFactory(() => MoviesBloc(sl()));
  }
}
