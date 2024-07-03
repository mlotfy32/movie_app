import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/constants.dart';

class CustomeDivider extends StatelessWidget {
  const CustomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 440),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.deepPurpleAccent])),
        width: Constants.width * 0.3,
        height: 6,
      ),
    );
  }
}
