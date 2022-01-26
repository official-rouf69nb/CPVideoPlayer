///Name: Md. Abdur Rouf
///Email: official.rouf69nb@gmail.com
///Created at: Jan 26, 2022

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationDetectorWidget extends StatefulWidget {
  final double aspectRatio;
  final Widget child;
  const OrientationDetectorWidget({Key? key, required this.child, this.aspectRatio = 16/ 9}) : super(key: key);

  @override
  _OrientationDetectorWidgetState createState() => _OrientationDetectorWidgetState();
}
class _OrientationDetectorWidgetState extends State<OrientationDetectorWidget> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          MediaQueryData _mediaQuery = MediaQuery.of(context);
          if(_mediaQuery.orientation == Orientation.portrait){
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          }
          else{
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          }


          if(_mediaQuery.orientation == Orientation.portrait) {
            return AspectRatio(
              aspectRatio: widget.aspectRatio,
              child: widget.child,
            );
          }
          else {
            return SizedBox(
              height: _mediaQuery.size.height,
              width: _mediaQuery.size.width,
              child: widget.child,
            );
          }
        }
    );
  }
}