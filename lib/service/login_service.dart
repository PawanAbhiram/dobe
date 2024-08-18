import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:dobe/base_api_service.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/model/user.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;

class LoginApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(Uri url) async {
  }
  
  @override
  Future postApi(String url, Map<String, dynamic> body)async {
    // TODO: implement postApi
    ApiResponse? apiResponse;
    try {
      var queryParameters = {
  'code': 'yiraLifeMobileLogin',
  "type": 'email',
};
var headers = {
  HttpHeaders.contentTypeHeader: 'application/json',
};
      final response =
          await http.post(Uri.parse(url).replace(queryParameters: queryParameters),
          
          headers: headers,
              


          
          
          body: jsonEncode(body)
          
          ).timeout(const Duration(seconds: 10));
 apiResponse=ApiResponse.fromData(Login.fromJson(jsonDecode(response.body)), response.statusCode);
return apiResponse;
    } catch (err){
    return  apiResponse=ApiResponse.fromData(null, 0,exception: err );
   //  throw ApiResponse.error(err.toString());
    }

  }


  Future<dynamic> endOauthSession({FlutterAppAuth? appAuth,String? idToken,String? postLogoutRedirectUrl,AuthorizationServiceConfiguration? serviceConfiguration})async{
  var data=  appAuth?.endSession(EndSessionRequest(
          idTokenHint: idToken,
          postLogoutRedirectUrl: postLogoutRedirectUrl,
          serviceConfiguration: serviceConfiguration));
          return data;

  }


    Future<String> testApi(TokenResponse? response,String? accessToken ) async {
    final http.Response httpResponse = await http.get(
        Uri.parse('https://demo.duendesoftware.com/api/test'),
        headers: <String, String>{'Authorization': 'Bearer $accessToken'});
    //setState(() {
     return  httpResponse.statusCode == 200 ? httpResponse.body : '';
      // isBusy = false;
      // notifyListeners();
    //});
  }

Future<TokenResponse> refresh({FlutterAppAuth? appAuth,String? clientId,redirectUrl,refreshToken,issuer,List<String>? scopes })async{
  TokenResponse? result = await appAuth?.token(TokenRequest(
          clientId!, redirectUrl,
          refreshToken: refreshToken, issuer: issuer, scopes: scopes));
return Future.value(result);

}
  Future<TokenResponse> exchangeCode({FlutterAppAuth? appAuth,String? clientId,redirectUrl,authorizationCode,discoveryUrl,codeVerifier,nonce,List<String>? scopes }) async {
   TokenResponse? result;
    try {
       result = await appAuth?.token(TokenRequest(
          clientId!, redirectUrl,
          authorizationCode: authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: codeVerifier,
          nonce: nonce,
          scopes: scopes));
          return Future.value(result);
    } catch (_) {
      return Future.value(result);
    }
  }

  Future<AuthorizationResponse> signInWithNoCodeExchange({FlutterAppAuth? appAuth,String? clientId,redirectUrl,discoveryUrl,List<String>? scopes}) async {
    AuthorizationResponse? result;
    try {
       result = await appAuth?.authorize(
        AuthorizationRequest(clientId!, redirectUrl,
            discoveryUrl: discoveryUrl, scopes: scopes, loginHint: 'bob'),
      );

     return Future.value(result);

    } catch (_) {

           return Future.value(result);

    }
  }

    Future<AuthorizationResponse> signInWithNoCodeExchangeAndGeneratedNonce({FlutterAppAuth? appAuth,String? clientId,redirectUrl,authorizationCode,discoveryUrl,codeVerifier,nonce,List<String>? scopes}) async {
    AuthorizationResponse? result;
    try {
      final Random random = Random.secure();
      final String nonce =
          base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
      // use the discovery endpoint to find the configuration
       result = await appAuth?.authorize(
        AuthorizationRequest(clientId!, redirectUrl,
            discoveryUrl: discoveryUrl,
            scopes: scopes,
            loginHint: 'bob',
            nonce: nonce),
      );
return Future.value(result);
    } catch (_) {
return Future.value(result);

    }
  }



  Future<AuthorizationTokenResponse> signInWithAutoCodeExchange(
     { FlutterAppAuth? appAuth,String? clientId,redirectUrl ,AuthorizationServiceConfiguration? serviceConfiguration,List<String>? scopes,bool? preferEphemeralSession}) async {
  AuthorizationTokenResponse? result;
  
    try {

     
       result =
          await appAuth?.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId!,
          redirectUrl,
          serviceConfiguration: serviceConfiguration,
          scopes: scopes,
          preferEphemeralSession: preferEphemeralSession??false,
        ),
      );

      return Future.value(result);
    } catch (_) {
      return Future.value(result);
    }
  }

}