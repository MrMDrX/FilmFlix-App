import 'package:filmflix/core/common/entities/media.dart';

class WatchlistItemModel extends Media {
  const WatchlistItemModel({
    required super.tmdbId,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterUrl,
    required super.backdropUrl,
    required super.overview,
    required super.isMovie,
  });

  factory WatchlistItemModel.fromEntity(Media media) {
    return WatchlistItemModel(
      tmdbId: media.tmdbId,
      title: media.title,
      releaseDate: media.releaseDate,
      voteAverage: media.voteAverage,
      posterUrl: media.posterUrl,
      backdropUrl: media.backdropUrl,
      overview: media.overview,
      isMovie: media.isMovie,
    );
  }
}
