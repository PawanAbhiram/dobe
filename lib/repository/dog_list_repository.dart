import 'package:dobe/base_api_service.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/service/dog_list_service.dart';

class DogListRepository{
  final BaseApiServices _apiServices = DogListService();
  Future<ApiResponse> getDogListData(Uri url) async {
    dynamic response;
    try {
      response =
      await _apiServices.getGetApiResponse(url);
      return response;
    } catch (e, s) {
      return response;
    }
  }
}