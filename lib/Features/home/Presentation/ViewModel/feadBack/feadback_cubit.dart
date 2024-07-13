import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feadback_state.dart';

class FeadbackCubit extends Cubit<FeadbackState> {
  FeadbackCubit() : super(FeadbackInitial());
  List<int> Stars = [];
  stars(int index) {
    log('$Stars');
    if (Stars.contains(index)) {
      Stars.remove(index);
      emit(Feadback(stars: Stars, star: Stars.isEmpty ? false : true));
    } else {
      Stars.add(index);
      emit(Feadback(stars: Stars, star: Stars.isEmpty ? false : true));
    }
    log('$Stars');
  }
}
