import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/blocOpserver.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/detailes/Presentation/ViewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:movies_app/Features/splasheScreen/Presentation/View/splashView.dart';

import 'Features/splasheScreen/Presentation/ViewModel/splash/splash_cubit.dart';

void main() async {
  Bloc.observer = SimpleBloOpserver();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  // await Hive.openBox(Constants.KBox);
  // await Hive.openBox(Constants.KHiveFavorite);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddtofavoriteCubit>(
      create: (context) => AddtofavoriteCubit(),
      child: GetMaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.PrimaryColor,
            appBarTheme: AppBarTheme(
                color: ColorManager.PrimaryColor, centerTitle: true)),
        debugShowCheckedModeBanner: false,
        home: Splashview(),
      ),
    );
  }
}
