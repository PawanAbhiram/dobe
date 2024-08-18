abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(Uri url);
  Future<dynamic> postApi(String url,Map<String,dynamic> body);


}
