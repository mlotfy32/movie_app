import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'draweranimation_state.dart';

class DraweranimationCubit extends Cubit<DraweranimationState> {
  DraweranimationCubit() : super(DraweranimationInitial());
  StartScale() {
    Timer(Duration(milliseconds: 400), () => emit(DraweranimationStart()));
  }
}
