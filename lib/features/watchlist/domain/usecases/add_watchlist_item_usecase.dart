import 'package:dartz/dartz.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/features/watchlist/domain/repository/watchlist_repository.dart';

class AddWatchlistItemUseCase extends UseCase<int, Media> {
  final WatchlistRepository _baseWatchListRepository;

  AddWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, int>> call(Media p) async {
    return await _baseWatchListRepository.addWatchListItem(p);
  }
}
