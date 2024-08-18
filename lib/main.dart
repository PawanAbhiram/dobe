import 'package:dobe/environment/environment_provider.dart';
import 'package:dobe/firebase/analytics.dart';
import 'package:dobe/firebase/appevents.dart';
import 'package:dobe/screens/dog_breed_list_screen.dart';
import 'package:dobe/screens/splash_screen.dart';
import 'package:dobe/viewmodels/dog_details_viewmodel.dart';
import 'package:dobe/viewmodels/dog_list_viewmodel.dart';
import 'package:dobe/reusable/null_error_widget.dart';
import 'package:dobe/routes/routes.dart';
import 'package:dobe/routes/routes_names.dart';
import 'package:dobe/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
    ErrorWidget.builder=(details){
      return NullErrorWidget(errorText: details.stack.toString(),);

    };
      FirebaseApp app = await Firebase.initializeApp(
    );
    print('Initialized default app $app');
  Analytics.initFirebaseAnalaytics();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EnvironmentProvider()),
                ChangeNotifierProvider(create: (_) => DogListViewModel()),

                ChangeNotifierProvider(create: (_) => DogDetailsViewModel()),

      ],
    
  child:   MaterialApp(
      title: 'Dobe',
      theme: lightTheme,
        onGenerateRoute: Routes.generateRoutes,

      darkTheme: darkTheme,
      home:  SplashScreen(),
    ));
  }
}


