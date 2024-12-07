import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/features/shows/domain/entities/season_details.dart';
import 'package:filmflix/features/shows/domain/repository/shows_repository.dart';

class GetSeasonDetailsUseCase
    extends UseCase<SeasonDetails, SeasonDetailsParams> {
  final TVShowsRepository _baseTVShowsRepository;

  GetSeasonDetailsUseCase(this._baseTVShowsRepository);
  @override
  Future<Either<Failure, SeasonDetails>> call(SeasonDetailsParams p) async {
    return await _baseTVShowsRepository.getSeasonDetails(p);
  }
}

class SeasonDetailsParams extends Equatable {
  final int id;
  final int seasonNumber;

  const SeasonDetailsParams({
    required this.id,
    required this.seasonNumber,
  });

  @override
  List<Object?> get props => [
        id,
        seasonNumber,
      ];
}
