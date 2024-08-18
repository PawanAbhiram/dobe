import 'package:dobe/base_api_service.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/service/dog_image_service.dart';

class DogImageRepository{
  final BaseApiServices _apiServices = DogImageService();
  Future<ApiResponse> getDogImageData(Uri url) async {
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