import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          children: [
            Lottie.asset('assets/lottie/dog_lottie.json'),
//SizedBox(height: 10,),

Text('Coming Soon!',
style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  fontWeight: FontWeight.w900,
  fontSize: 22,
),
)

          ],
        ),
      )),
    );
  }
}