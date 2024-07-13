import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/feadBack/feadback_cubit.dart';
import 'package:movies_app/Features/vedioPlayer/Data/repos/VideoRepoImpl.dart';

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

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<Videorepoimpl>(Videorepoimpl());
}
