import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/GetMoviesData.dart';

class Bottomsection extends StatelessWidget {
  const Bottomsection({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return Container(
        margin: EdgeInsets.only(top: Constants.height * 0.58),
        width: Constants.width,
        height: Constants.height * 0.42,
        child: GetMovieData());
  }
}
