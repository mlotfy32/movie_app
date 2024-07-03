import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_next_image_state.dart';

class GetNextImageCubit extends Cubit<GetNextImageState> {
  GetNextImageCubit() : super(GetNextImageInitial());
  getNextImage(int index, PageController _controller) {
    int newIndex = index;
    if (index == 19) {
      emit(GetNextImagestate(index: 0));

      _controller.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else if (index < 19) {
      newIndex += 1;

      emit(GetNextImagestate(index: newIndex));
      _controller.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else if (index > 19) {
      newIndex -= 1;

      emit(GetNextImagestate(index: newIndex));
      _controller.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }
}
