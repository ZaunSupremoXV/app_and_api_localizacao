import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset("assets/images/octocat.gif"),
      height: 150.0,
      width: 150.0,
    );
  }
}
