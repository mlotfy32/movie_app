import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/splasheScreen/Presentation/View/Widgets/Splash_ScreenBody.dart';
import 'package:movies_app/Features/splasheScreen/Presentation/ViewModel/splash/splash_cubit.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(),
      child: SplashScreenBody(),
    );
  }
}
