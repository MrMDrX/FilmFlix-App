import 'package:dio/dio.dart';
import 'package:filmflix/core/constants/api_constants.dart';
import 'package:filmflix/core/error/exceptions.dart';
import 'package:filmflix/core/network/error_message_model.dart';
import 'package:filmflix/features/search/data/models/search_result_item_model.dart';

abstract class SearchRemoteSource {
  Future<List<SearchResultItemModel>> search(String title);
}

class SearchRemoteSourceImpl extends SearchRemoteSource {
  @override
  Future<List<SearchResultItemModel>> search(String title) async {
    final response = await Dio().get(ApiConstants.getSearchPath(title));
    if (response.statusCode == 200) {
      return List<SearchResultItemModel>.from((response.data['results'] as List)
          .where((e) => e['media_type'] != 'person')
          .map((e) => SearchResultItemModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
