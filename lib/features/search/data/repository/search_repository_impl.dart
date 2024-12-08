import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/search/data/source/search_remote_source.dart';
import 'package:filmflix/features/search/domain/entities/search_result_item.dart';
import 'package:filmflix/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteSource _baseSearchRemoteSource;

  SearchRepositoryImpl(this._baseSearchRemoteSource);

  @override
  Future<Either<Failure, List<SearchResultItem>>> search(String title) async {
    try {
      final result = await _baseSearchRemoteSource.search(title);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
