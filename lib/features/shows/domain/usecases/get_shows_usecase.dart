import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';

class GetTVShowsUseCase extends UseCase<List<List<Media>>, NoParams> {
  final TVShowsRepository _baseTVShowsRepository;

  GetTVShowsUseCase(this._baseTVShowsRepository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParams p) async {
    return await _baseTVShowsRepository.getTVShows();
  }
}
