import 'package:dobe/screens/coming_soon_screen.dart';
import 'package:dobe/screens/dog_breed_list_screen.dart';
import 'package:dobe/screens/dog_detail_screen.dart';
import 'package:dobe/routes/routes_names.dart';
import 'package:dobe/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    Map? data= settings.arguments!=null?settings.arguments as Map:null ;
    switch (settings.name) {
      case (RouteNames.doglistScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const DogBreedListScreen());
                  case (RouteNames.comingSoonScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const ComingSoonScreen());
                  case (RouteNames.splashScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SplashScreen());


            case (RouteNames.dogDetailsScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) =>  DogDetailsScreen(
              breedName: data!['breed_name'],
              subBreeds:data['sub_breeds']!=null? data['sub_breeds']:[],
            ));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
