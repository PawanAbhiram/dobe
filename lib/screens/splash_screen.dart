import 'package:flutter/material.dart';
import 'package:dobe/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(milliseconds: 100)); // Delay for 10 milliseconds
    Navigator.of(context).pushReplacementNamed(RouteNames.doglistScreen
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white,
      body: Center(
        // child: Text(
        //   'Splash Screen',
        //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}
