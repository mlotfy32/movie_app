import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';

abstract class helper {
  static CustomeDialog(String title, String url) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.all(5),
        backgroundColor: ColorManager.PrimaryColor,
        title: title,
        titleStyle: Fontstyles.titleStyle,
        content: Material(
          color: ColorManager.PrimaryColor,
          child: Center(
            child: Lottie.asset(url,
                width: Constants.width * 0.6, height: Constants.height * 0.17),
          ),
        ));
  }
}
