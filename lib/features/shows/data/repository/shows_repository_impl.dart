import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/shows/data/source/shows_remote_source.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';

class TVShowsRepositoryImpl extends TVShowsRepository {
  final TVShowsRemoteSource _baseTVShowsRemoteSource;

  TVShowsRepositoryImpl(this._baseTVShowsRemoteSource);

  @override
  Future<Either<Failure, List<List<Media>>>> getTVShows() async {
    try {
      final result = await _baseTVShowsRemoteSource.getTVShows();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
