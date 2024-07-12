import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/constants.dart';

class CustomeDivider extends StatelessWidget {
  const CustomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.56,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.deepPurpleAccent])),
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: MediaQuery.sizeOf(context).height * 0.008,
      ),
    );
  }
}
