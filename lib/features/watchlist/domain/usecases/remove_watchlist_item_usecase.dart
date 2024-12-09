import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/features/watchlist/domain/repository/watchlist_repository.dart';

class RemoveWatchlistItemUseCase extends UseCase<Unit, int> {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
