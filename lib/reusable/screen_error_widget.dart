import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ScreenErrorWidget extends StatefulWidget {
  const ScreenErrorWidget({super.key});

  @override
  State<ScreenErrorWidget> createState() => _ScreenErrorWidgetState();
}

class _ScreenErrorWidgetState extends State<ScreenErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Some Error Occured Please Try Again Later')
        ],
      ),
    );
  }
}