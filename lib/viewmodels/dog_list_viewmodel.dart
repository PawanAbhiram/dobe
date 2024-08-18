import 'package:dobe/constants/error_constants.dart';
import 'package:dobe/enums/response_status.dart';
import 'package:dobe/environment/environment_provider.dart';
import 'package:dobe/model/api_response.dart';
import 'package:dobe/model/dog_breeds.dart';
import 'package:dobe/model/dog_image.dart';
import 'package:dobe/repository/dog_list_repository.dart';
import 'package:dobe/utils/no_internet_dailog.dart';
import 'package:dobe/utils/snackbar_utils.dart';
import 'package:dobe/utils/url_utils.dart';
import 'package:dobe/viewmodels/dog_details_viewmodel.dart';
import 'package:flutter/material.dart';

class DogListViewModel with ChangeNotifier{

    final _getDogBreedRepo = DogListRepository();
  EnvironmentProvider provider = EnvironmentProvider();
  DogDetailsViewModel dogDetailsViewModel=DogDetailsViewModel();
  DogBreeds? dogBreeds;
  List<DogImage> dogImagedata=[];
  ApiResponse<dynamic>? getDogBreeds;


  Future<DogBreeds> getDogList(GlobalKey<ScaffoldState>? scaffoldKey,{BuildContext? context}) async {
    //Analytics.initFirebaseAnalaytics();
    getDogBreeds = ApiResponse.loading();
  //  notifyListeners();
  await provider.fetchEnvironment();
    final config = await provider.environmentStream.first;
    print('the url was ${config.baseUrl}${UrlUtils.dog_breed_list}');

  Uri uri=  Uri.parse('${config.baseUrl}${UrlUtils.dog_breed_list}');
    getDogBreeds = await _getDogBreedRepo.getDogListData(uri);
    debugPrint('Response Status: ${getDogBreeds?.status}');
    if (getDogBreeds?.status == ResponseStatus.completed 
        ) {
      if(scaffoldKey!=null)
        SnackBarUtils.showSnackBar(context!,
            scaffoldKey: scaffoldKey,
            message: getDogBreeds?.message??'UnKnown Error Occurred'
        );
      dogBreeds = getDogBreeds?.data;
    //Todo UnComment These Lines To Load Images At Once  
// if(dogBreeds!=null&&dogBreeds!.breeds!.isNotEmpty){
//   for(var data in  dogBreeds!.breeds!.keys){
//     getDogImage(data, context, scaffoldKey);
//   }
//}
notifyListeners();
return Future.value(dogBreeds);
    }else {
      if(getDogBreeds?.status == ResponseStatus.error ){
        if(getDogBreeds?.exceptiondetail?.errorCode==ErrorCodes.INTERNT_ERROR){
          if(scaffoldKey!=null)
          NoInternetDailog.showNoInternetDailog(scaffoldKey);

        }else{
          if(scaffoldKey!=null)
          SnackBarUtils.showSnackBar(context!,
          scaffoldKey: scaffoldKey,
          message: getDogBreeds?.message??'UnKnown Error Occurred'
          );
        }
        return Future.value(DogBreeds());
      }
    }
    
    notifyListeners();
            return Future.value(DogBreeds());

  }



  Future<DogImage> getDogImage(String breed_name,BuildContext context,GlobalKey<ScaffoldState>? scaffoldKey)async{
var imageData=await dogDetailsViewModel.getDogImageData( scaffoldKey, breed_name,context: context);
dogImagedata.add(imageData);

notifyListeners();

return Future.value(imageData);
  }

}