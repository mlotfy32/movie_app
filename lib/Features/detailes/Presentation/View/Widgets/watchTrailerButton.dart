import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: Constants.width,
        height: Constants.height * 0.1,
        child: Text(
          AppStrings.WatchTrailer,
          style: Fontstyles.titleStyle,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.deepPurpleAccent])),
      ),
    );
  }
}
