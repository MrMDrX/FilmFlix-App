import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/features/search/domain/entities/search_result_item.dart';

class SearchResultItemModel extends SearchResultItem {
  const SearchResultItemModel({
    required super.tmdbId,
    required super.posterUrl,
    required super.title,
    required super.isMovie,
  });

  factory SearchResultItemModel.fromJson(Map<String, dynamic> json) {
    return SearchResultItemModel(
      tmdbId: json['id'],
      posterUrl: getPosterUrl(json['poster_path']),
      title: json['title'] ?? json['name'],
      isMovie: json['media_type'] == 'movie',
    );
  }
}
