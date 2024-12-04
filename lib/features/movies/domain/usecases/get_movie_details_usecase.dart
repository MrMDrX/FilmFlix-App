import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';

class GetMoviesDetailsUseCase extends UseCase<MediaDetails, int> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesDetailsUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseMoviesRespository.getMovieDetails(p);
  }
}
