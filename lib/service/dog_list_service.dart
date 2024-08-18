import 'dart:convert';
import 'dart:io';

import 'package:dobe/base_api_service.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/model/dog_breeds.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DogListService extends BaseApiServices {
  @override
  Future getGetApiResponse(Uri url) async {
    ApiResponse<DogBreeds>? apiResponse;

        try {
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        //HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      };
      final response = await http
          .get(url, )
          ;

      debugPrint("DOG LIST SERVICE RESPONSE ${response.body}");

      apiResponse = ApiResponse.fromData(
          DogBreeds.fromJson(jsonDecode(response.body)), response.statusCode);
      return apiResponse;
    } catch (err) {
      return apiResponse = ApiResponse.fromData(DogBreeds(), 0, exception: err);
      //  throw ApiResponse.error(err.toString());
    }


  }
  
  @override
  Future postApi(String url, Map<String, dynamic> body) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

}