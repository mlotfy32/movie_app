import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';

part 'addtofavorite_state.dart';

class AddtofavoriteCubit extends Cubit<AddtofavoriteState> {
  AddtofavoriteCubit() : super(AddtofavoriteInitial());

  addToFavorite(FavoriteModel favorite, String title) async {
    helper.CustomeDialog(AppStrings.loading, Appassetes.loadingDialog);
    await Hive.close();
    try {
      if (!Hive.isBoxOpen(Constants.KBox)) {
        await Hive.openBox(Constants.KBox);
        await Hive.openBox(Constants.KHiveFavorite);
        await Hive.box(Constants.KHiveFavorite).add(favorite);
        await Hive.box(Constants.KBox).put(title, title);
      }
      Get.back();
      helper.CustomeDialog(AppStrings.success, Appassetes.successDialog);
      emit(AddtofavoriteSuccess());
      emit(AddtofavoriteSuccess());
      emit(buttonFavoraitState(isFavorite: true));
    } catch (e) {
      helper.CustomeDialog(
          AppStrings.faildtoSaveData, Appassetes.failureDialog);

      emit(AddtofavoriteFailure());
    }
  }
}
