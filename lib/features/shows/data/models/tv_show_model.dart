import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/utils/helpers.dart';

class TVShowModel extends Media {
  const TVShowModel({
    required super.tmdbId,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.voteAverage,
    required super.releaseDate,
    required super.overview,
    required super.isMovie,
  });

  factory TVShowModel.fromJson(Map<String, dynamic> json) {
    return TVShowModel(
      tmdbId: json['id'],
      title: json['name'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      voteAverage: double.parse((json['vote_average']).toStringAsFixed(1)),
      releaseDate: getDate(json['first_air_date']),
      overview: json['overview'],
      isMovie: false,
    );
  }
}
