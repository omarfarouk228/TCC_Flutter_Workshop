import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.width, this.height, super.key});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/logo.png", width: width, height: height);
  }
}
