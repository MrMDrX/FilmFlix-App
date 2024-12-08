import 'package:equatable/equatable.dart';

class SearchResultItem extends Equatable {
  final int tmdbId;
  final String posterUrl;
  final String title;
  final bool isMovie;

  const SearchResultItem({
    required this.tmdbId,
    required this.posterUrl,
    required this.title,
    required this.isMovie,
  });

  @override
  List<Object?> get props => [
        tmdbId,
        posterUrl,
        title,
        isMovie,
      ];
}
