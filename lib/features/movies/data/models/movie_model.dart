import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/utils/helpers.dart';

class MovieModel extends Media {
  const MovieModel({
    required super.tmdbId,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.voteAverage,
    required super.releaseDate,
    required super.overview,
    required super.isMovie,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        tmdbId: json['id'],
        title: json['title'],
        posterUrl: getPosterUrl(json['poster_path']),
        backdropUrl: getBackdropUrl(json['backdrop_path']),
        voteAverage: double.parse((json['vote_average']).toStringAsFixed(1)),
        releaseDate: getDate(json['release_date']),
        overview: json['overview'] ?? '',
        isMovie: true,
      );
}
