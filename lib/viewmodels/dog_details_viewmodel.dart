import 'package:dobe/constants/error_constants.dart';
import 'package:dobe/enums/response_status.dart';
import 'package:dobe/environment/environment_provider.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/model/dog_image.dart';
import 'package:dobe/repository/dog_image_repository.dart';
import 'package:dobe/utils/no_internet_dailog.dart';
import 'package:dobe/utils/snackbar_utils.dart';
import 'package:dobe/utils/url_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DogDetailsViewModel with ChangeNotifier{
      final _getDogImageRepo = DogImageRepository();
  EnvironmentProvider provider = EnvironmentProvider();
  DogImage? dogImage;
  ApiResponse<dynamic>? getDogImage;

  Future<DogImage> getDogImageData(GlobalKey<ScaffoldState>? scaffoldKey,String breed,{BuildContext? context}) async {
    //Analytics.initFirebaseAnalaytics();
    getDogImage = ApiResponse.loading();
  //  notifyListeners();
  await provider.fetchEnvironment();
    final config = await provider.environmentStream.first;
    print('the url was ${config.baseUrl}${UrlUtils.dog_image_url(breed)}');

  Uri uri=  Uri.parse('${config.baseUrl}${UrlUtils.dog_image_url(breed)}');
    getDogImage = await _getDogImageRepo.getDogImageData(uri);
    debugPrint('Response Status: ${getDogImage?.status}');
    if (getDogImage?.status == ResponseStatus.completed 
        ) {
      if(scaffoldKey!=null)
        // SnackBarUtils.showSnackBar(context!,
        //     scaffoldKey: scaffoldKey,
        //     message: getDogImage?.message??'UnKnown Error Occurred'
        // );
      dogImage = getDogImage?.data;
return Future.value(dogImage);
    }else {
      if(getDogImage?.status == ResponseStatus.error ){
        if(getDogImage?.exceptiondetail?.errorCode==ErrorCodes.INTERNT_ERROR){
          if(scaffoldKey!=null)
          NoInternetDailog.showNoInternetDailog(scaffoldKey);

        }else{
         // if(scaffoldKey!=null)
          // SnackBarUtils.showSnackBar(context,
          // scaffoldKey: scaffoldKey,
          // message: getDogImage?.message??'UnKnown Error Occurred'
          // );
        }
        return Future.value(DogImage());
      }
    }
    
    notifyListeners();
            return Future.value(DogImage());

  }

}