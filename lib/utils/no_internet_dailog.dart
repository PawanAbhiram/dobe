import 'package:flutter/material.dart';

class NoInternetDailog{


  static void showNoInternetDailog(GlobalKey<ScaffoldState>? scaffoldKey,)async{

    showDialog(
          context: scaffoldKey!.currentContext!,
          builder: (BuildContext context) {
            return AlertDialog(
      title: const Text('No Internet Connection'),
      content: Text('Please enable your data connection to continue'),
      

                  actions: [
        TextButton(
          onPressed: () {
            Navigator.of(scaffoldKey.currentContext!).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: (){
                            Navigator.of(scaffoldKey.currentContext!).pop();

          },
          child: const Text('Retry'),
        ),
      ],

            
            
            );
          });

  }
}