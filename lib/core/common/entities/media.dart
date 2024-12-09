import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filmflix/core/common/entities/media_details.dart';

part 'media.g.dart';

@HiveType(typeId: 1)
class Media extends Equatable {
  @HiveField(0)
  final int tmdbId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final String backdropUrl;
  @HiveField(4)
  final double voteAverage;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final String overview;
  @HiveField(7)
  final bool isMovie;

  const Media({
    required this.tmdbId,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.isMovie,
  });

  factory Media.fromMediaDetails(MediaDetails mediaDetails) {
    return Media(
      tmdbId: mediaDetails.tmdbId,
      title: mediaDetails.title,
      posterUrl: mediaDetails.posterUrl,
      backdropUrl: mediaDetails.backdropUrl,
      voteAverage: mediaDetails.voteAverage,
      releaseDate: mediaDetails.releaseDate,
      overview: mediaDetails.overview,
      isMovie: mediaDetails.lastEpisodeToAir == null,
    );
  }

  @override
  List<Object?> get props => [
        tmdbId,
        title,
        posterUrl,
        backdropUrl,
        voteAverage,
        releaseDate,
        overview,
        isMovie,
      ];
}
