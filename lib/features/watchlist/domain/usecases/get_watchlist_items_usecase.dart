import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/features/watchlist/domain/repository/watchlist_repository.dart';

class GetWatchlistItemsUseCase extends UseCase<List<Media>, NoParams> {
  final WatchlistRepository _baseWatchListRepository;

  GetWatchlistItemsUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, List<Media>>> call(NoParams p) async {
    return await _baseWatchListRepository.getWatchListItems();
  }
}
