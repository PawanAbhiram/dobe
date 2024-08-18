import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NullErrorWidget extends StatelessWidget {
  const NullErrorWidget({super.key,this.errorText});
final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(10),
              child:Text('Something Went Wrong Please Try Again Later',
              style: Theme.of(context).textTheme.bodyLarge,
              ) ,
              
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}