import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filmflix/core/error/failure.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/features/watchlist/data/models/watchlist_item_model.dart';
import 'package:filmflix/features/watchlist/data/source/watchlist_local_source.dart';
import 'package:filmflix/features/watchlist/domain/repository/watchlist_repository.dart';

class WatchListRepositoryImpl extends WatchlistRepository {
  final WatchlistLocalSource _baseWatchlistLocalSource;

  WatchListRepositoryImpl(this._baseWatchlistLocalSource);

  @override
  Future<Either<Failure, List<Media>>> getWatchListItems() async {
    final result = (await _baseWatchlistLocalSource.getWatchListItems());
    try {
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> addWatchListItem(Media media) async {
    try {
      int id = await _baseWatchlistLocalSource.addWatchListItem(
        WatchlistItemModel.fromEntity(media),
      );
      return Right(id);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWatchListItem(int index) async {
    try {
      await _baseWatchlistLocalSource.removeWatchListItem(index);
      return const Right(unit);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async {
    try {
      final result = await _baseWatchlistLocalSource.isItemAdded(tmdbId);
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }
}
