import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';

part 'remove_from_favorite_state.dart';

class RemoveFromFavoriteCubit extends Cubit<RemoveFromFavoriteState> {
  RemoveFromFavoriteCubit() : super(RemoveFromFavoriteInitial());
  removeFavorite(String Key) async {
    emit(RemoveFromFavoriteLoading());
    try {
      await Hive.close();
      if (!Hive.isBoxOpen(Constants.KBox)) {
        await Hive.openBox(Constants.KBox);
        await Hive.box(Constants.KBox).delete(Key);
        emit(RemoveFromFavoritSuccess());
      } else {
        await Hive.box(Constants.KBox).delete(Key);
        emit(RemoveFromFavoritSuccess());
      }
    } catch (e) {
      emit(RemoveFromFavoriteFailure(failure: AppStrings.faildtoRemove));
    }
  }
}
