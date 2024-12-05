import 'package:dartz/dartz.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/error/failure.dart';

abstract class TVShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTVShows();
}
