import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Features/splasheScreen/Presentation/View/splashView.dart';

import 'Features/splasheScreen/Presentation/ViewModel/splash/splash_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.PrimaryColor,
          appBarTheme:
              AppBarTheme(color: ColorManager.PrimaryColor, centerTitle: true)),
      debugShowCheckedModeBanner: false,
      home: Splashview(),
    );
  }
}
