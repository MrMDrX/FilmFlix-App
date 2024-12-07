import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';

class GetTVShowDetailsUseCase extends UseCase<MediaDetails, int> {
  final TVShowsRepository _baseTVShowsRepository;

  GetTVShowDetailsUseCase(this._baseTVShowsRepository);
  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseTVShowsRepository.getTVShowDetails(p);
  }
}
