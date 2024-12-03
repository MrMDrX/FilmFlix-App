import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';

class GetAllTopRatedMoviesUseCase extends UseCase<List<Media>, int> {
  final MoviesRespository _baseMoviesRespository;

  GetAllTopRatedMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<Media>>> call(int p) async {
    return await _baseMoviesRespository.getAllTopRatedMovies(p);
  }
}
