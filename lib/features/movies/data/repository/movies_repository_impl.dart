import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/movies/data/source/movies_remote_source.dart';
import 'package:filmflix/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRespository {
  final MoviesRemoteSource _baseMoviesRemoteSource;

  MoviesRepositoryImpl(this._baseMoviesRemoteSource);

  @override
  Future<Either<Failure, List<List<Media>>>> getMovies() async {
    try {
      final result = await _baseMoviesRemoteSource.getMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
