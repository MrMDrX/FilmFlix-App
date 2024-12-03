import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/error/failure.dart';

abstract class MoviesRespository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page);
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page);
}
