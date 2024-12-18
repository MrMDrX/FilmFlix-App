import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/shows/data/source/shows_remote_source.dart';
import 'package:filmflix/features/shows/domain/entities/season_details.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';
import 'package:filmflix/features/shows/domain/usecases/get_season_details_usecase.dart';

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

  @override
  Future<Either<Failure, List<Media>>> getAllPopularTVShows(int page) async {
    try {
      final result = await _baseTVShowsRemoteSource.getAllPopularTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllTopRatedTVShows(int page) async {
    try {
      final result = await _baseTVShowsRemoteSource.getAllTopRatedTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getTVShowDetails(int id) async {
    try {
      final result = await _baseTVShowsRemoteSource.getTVShowDetails(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
      SeasonDetailsParams params) async {
    try {
      final result = await _baseTVShowsRemoteSource.getSeasonDetails(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
