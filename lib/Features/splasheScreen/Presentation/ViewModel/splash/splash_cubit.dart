import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Features/home/Presentation/View/home.dart';
import 'package:get/get.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  startAnimation() {
    emit(StartAnimationState(true));
    Timer(Duration(seconds: 3),
        () => Get.offAll(() => const Home(), curve: Curves.easeInOut));
  }
}
