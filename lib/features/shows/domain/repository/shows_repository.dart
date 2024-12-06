import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/error/failure.dart';

abstract class TVShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTVShows();
  Future<Either<Failure, List<Media>>> getAllPopularTVShows(int page);
  Future<Either<Failure, List<Media>>> getAllTopRatedTVShows(int page);
}
