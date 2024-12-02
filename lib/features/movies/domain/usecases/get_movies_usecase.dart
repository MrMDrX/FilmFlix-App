import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';

class GetMoviesUseCase extends UseCase<List<List<Media>>, NoParams> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParams p) async {
    return await _baseMoviesRespository.getMovies();
  }
}
