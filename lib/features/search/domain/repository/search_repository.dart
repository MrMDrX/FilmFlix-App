import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/search/domain/entities/search_result_item.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
