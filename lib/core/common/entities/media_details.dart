import 'package:equatable/equatable.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/features/movies/domain/entities/cast.dart';
import 'package:filmflix/features/movies/domain/entities/review.dart';
import 'package:filmflix/features/shows/domain/entities/episode.dart';
import 'package:filmflix/features/shows/domain/entities/season.dart';

// ignore: must_be_immutable
class MediaDetails extends Equatable {
  int? id;
  final int tmdbId;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final String releaseDate;
  final String genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String overview;
  final double voteAverage;
  final String voteCount;
  final String trailerUrl;
  final List<Cast>? cast;
  final List<Review>? reviews;
  final List<Media> similar;
  final Episode? lastEpisodeToAir;
  final List<Season>? seasons;
  bool isAdded;

  MediaDetails({
    this.id,
    required this.tmdbId,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.genres,
    this.runtime,
    this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.trailerUrl,
    this.cast,
    this.reviews,
    required this.similar,
    this.lastEpisodeToAir,
    this.seasons,
    this.isAdded = false,
  });

  @override
  List<Object?> get props => [
        id,
        tmdbId,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        genres,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
        similar,
        isAdded,
      ];
}
