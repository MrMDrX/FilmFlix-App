class ApiConstants {
  static const String baseUrl = 'https://api.movies.tastejs.com';
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';
  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';
  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';
  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';
  static const String stillPlaceHolder =
      'https://popcornsg.s3.amazonaws.com/gallery/1577405144-six-year.png';

  // movies paths
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing';

  static const String popularMoviesPath = '$baseUrl/movie/popular';

  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated';

  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?append_to_response=videos,credits,reviews,similar';
  }

  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?page=$page';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?page=$page';
  }

  // tv shows paths
  static const String onAirTvShowsPath =
      '$baseUrl/tv/on_the_air?with_original_language=en';

  static const String popularTvShowsPath =
      '$baseUrl/tv/popular?with_original_language=en';

  static const String topRatedTvShowsPath =
      '$baseUrl/tv/top_rated?with_original_language=en';

  static String getAllPopularTvShowsPath(int page) {
    return '$baseUrl/tv/popular?page=$page&with_original_language=en';
  }

  static String getAllTopRatedTvShowsPath(int page) {
    return '$baseUrl/tv/top_rated?page=$page&with_original_language=en';
  }
}
