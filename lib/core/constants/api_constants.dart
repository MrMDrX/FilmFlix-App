class ApiConstants {
  static const String baseUrl = 'https://api.movies.tastejs.com';
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  // movies paths
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing';

  static const String popularMoviesPath = '$baseUrl/movie/popular';

  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated';

  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?page=$page';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?page=$page';
  }
}
