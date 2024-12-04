// ignore: must_be_immutable
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/features/movies/data/models/cast_model.dart';
import 'package:filmflix/features/movies/data/models/movie_model.dart';
import 'package:filmflix/features/movies/data/models/review_model.dart';

// ignore: must_be_immutable
class MovieDetailsModel extends MediaDetails {
  MovieDetailsModel({
    required super.tmdbId,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerUrl,
    required super.cast,
    required super.reviews,
    required super.similar,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      tmdbId: json['id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      releaseDate: getDate(json['release_date']),
      genres: getGenres(json['genres']),
      runtime: getLength(json['runtime']),
      overview: json['overview'] ?? '',
      voteAverage:
          double.parse((json['vote_average'] as double).toStringAsFixed(1)),
      voteCount: getVotesCount(json['vote_count']),
      trailerUrl: getTrailerUrl(json),
      cast: List<CastModel>.from(
          (json['credits']['cast'] as List).map((e) => CastModel.fromJson(e))),
      reviews: List<ReviewModel>.from((json['reviews']['results'] as List)
          .map((e) => ReviewModel.fromJson(e))),
      similar: List<MovieModel>.from((json['similar']['results'] as List)
          .map((e) => MovieModel.fromJson(e))),
    );
  }
}
