import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final int tmdbId;
  final String name;
  final int episodeCount;
  final String airDate;
  final String overview;
  final String posterUrl;
  final int seasonNumber;

  const Season({
    required this.tmdbId,
    required this.name,
    required this.episodeCount,
    required this.airDate,
    required this.overview,
    required this.posterUrl,
    required this.seasonNumber,
  });

  @override
  List<Object?> get props => [
        tmdbId,
        name,
        episodeCount,
        airDate,
        overview,
        posterUrl,
        seasonNumber,
      ];
}
