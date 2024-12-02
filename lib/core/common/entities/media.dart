import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final int tmdbId;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double voteAverage;
  final String releaseDate;
  final String overview;
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
