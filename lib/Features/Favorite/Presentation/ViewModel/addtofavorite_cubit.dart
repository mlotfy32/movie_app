import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';

part 'addtofavorite_state.dart';

class AddtofavoriteCubit extends Cubit<AddtofavoriteState> {
  AddtofavoriteCubit() : super(AddtofavoriteInitial());

  addToFavorite(FavoriteModel favorite) async {
    emit(AddtofavoriteLoading());
    await Hive.close();
    try {
      if (!Hive.isBoxOpen(Constants.KBox)) {
        await Hive.openBox(Constants.KBox);
      }
      await Hive.box(Constants.KBox).add(favorite);
      Get.back();
      emit(buttonFavoraitState(isFavorite: true));

      emit(AddtofavoriteSuccess());
    } catch (e) {
      debugPrint('===$e');
      emit(AddtofavoriteFailure());
    }
  }

  getFavorite() async {
    emit(AddtofavoriteLoading());
    await Hive.close();
    try {
      if (!Hive.isBoxOpen(Constants.KBox)) {
        await Hive.openBox<FavoriteModel>(Constants.KBox);
      }
      List<FavoriteModel> Data =
          await Hive.box<FavoriteModel>(Constants.KBox).values.toList();
      Get.back();
      emit(GetfavoriteSuccess(FavoriteMovies: Data));
    } catch (e) {
      emit(AddtofavoriteFailure());
    }
  }

  Future isContain(String title) async {
    await Hive.close();
    if (!Hive.isBoxOpen(Constants.KBox)) {
      await Hive.openBox<FavoriteModel>(Constants.KBox);
    }
    List<FavoriteModel> Data =
        await Hive.box<FavoriteModel>(Constants.KBox).values.toList();
    debugPrint('${Data[0].title}');
    for (int i = 0; i < Data.length; i++) {
      if (Data[i].title.contains(title)) {
        debugPrint('tttttttt');
        return true;
      } else {
        debugPrint('fffffffffffff');
        return false;
      }
    }
  }
}
