import 'package:dio/dio.dart';
import 'package:filmflix/core/constants/api_constants.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/network/error_message_model.dart';
import 'package:filmflix/features/shows/data/models/season_details_model.dart';
import 'package:filmflix/features/shows/data/models/tv_show_details_model.dart';
import 'package:filmflix/features/shows/data/models/tv_show_model.dart';
import 'package:filmflix/features/shows/domain/usecases/get_season_details_usecase.dart';

abstract class TVShowsRemoteSource {
  Future<List<List<TVShowModel>>> getTVShows();
  Future<List<TVShowModel>> getOnAirTVShows();
  Future<List<TVShowModel>> getPopularTVShows();
  Future<List<TVShowModel>> getTopRatedTVShows();
  Future<List<TVShowModel>> getAllPopularTVShows(int page);
  Future<List<TVShowModel>> getAllTopRatedTVShows(int page);
  Future<TVShowDetailsModel> getTVShowDetails(int id);
  Future<SeasonDetailsModel> getSeasonDetails(SeasonDetailsParams params);
}

class TVShowsRemoteSourceImpl extends TVShowsRemoteSource {
  @override
  Future<List<List<TVShowModel>>> getTVShows() async {
    final response = Future.wait(
      [
        getOnAirTVShows(),
        getPopularTVShows(),
        getTopRatedTVShows(),
      ],
      eagerError: true,
    );
    return response;
  }

  @override
  Future<List<TVShowModel>> getOnAirTVShows() async {
    final response = await Dio().get(ApiConstants.onAirTvShowsPath);
    if (response.statusCode == 200) {
      return List<TVShowModel>.from((response.data['results'] as List)
          .map((e) => TVShowModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TVShowModel>> getPopularTVShows() async {
    final response = await Dio().get(ApiConstants.popularTvShowsPath);
    if (response.statusCode == 200) {
      return List<TVShowModel>.from((response.data['results'] as List)
          .map((e) => TVShowModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TVShowModel>> getTopRatedTVShows() async {
    final response = await Dio().get(ApiConstants.topRatedTvShowsPath);
    if (response.statusCode == 200) {
      return List<TVShowModel>.from((response.data['results'] as List)
          .map((e) => TVShowModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TVShowModel>> getAllPopularTVShows(int page) async {
    final response =
        await Dio().get(ApiConstants.getAllPopularTvShowsPath(page));
    if (response.statusCode == 200) {
      return List<TVShowModel>.from((response.data['results'] as List)
          .map((e) => TVShowModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TVShowModel>> getAllTopRatedTVShows(int page) async {
    final response =
        await Dio().get(ApiConstants.getAllTopRatedTvShowsPath(page));
    if (response.statusCode == 200) {
      return List<TVShowModel>.from((response.data['results'] as List)
          .map((e) => TVShowModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TVShowDetailsModel> getTVShowDetails(int id) async {
    final response = await Dio().get(ApiConstants.getTvShowDetailsPath(id));
    if (response.statusCode == 200) {
      return TVShowDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SeasonDetailsModel> getSeasonDetails(
      SeasonDetailsParams params) async {
    final response = await Dio().get(ApiConstants.getSeasonDetailsPath(params));
    if (response.statusCode == 200) {
      return SeasonDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
