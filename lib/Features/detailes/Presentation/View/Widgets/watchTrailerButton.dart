import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/View/videoPlayer.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({super.key, required this.id, required this.title});
  final int id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Videoplayer(id: id, title: title),
            curve: Curves.bounceIn, duration: Duration(milliseconds: 900));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        width: Constants.width,
        height: Constants.height * 0.06,
        child: Center(
          child: Text(
            AppStrings.WatchTrailer,
            style: Fontstyles.titleStyle,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.deepPurpleAccent])),
      ),
    );
  }
}
