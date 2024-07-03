import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Features/splasheScreen/Presentation/ViewModel/splash/splash_cubit.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  Widget build(BuildContext context) {
    double pading = 0;
    double opacity = 0;
    return Material(
      child: Container(
        color: ColorManager.PrimaryColor,
        child: Center(
            child: BlocConsumer<SplashCubit, SplashState>(
          builder: (context, state) => AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 2),
            child: AnimatedPadding(
              duration: Duration(seconds: 2),
              padding: EdgeInsets.all(pading),
              child: Image.asset(Appassetes.LogoSplash),
            ),
          ),
          listener: (context, state) {
            if (state is StartAnimationState) {
              pading = 80;
              opacity = 1;
            }
          },
        )),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      BlocProvider.of<SplashCubit>(context).startAnimation();
    });
    super.initState();
  }
}
