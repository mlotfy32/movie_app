import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/favorite.dart';

part 'getdata_state.dart';

class GetdataCubit extends Cubit<GetdataState> {
  GetdataCubit() : super(GetdataInitial());
  getFavorite() async {
    emit(GetdataLoading());
    await Hive.close();
    try {
      if (!Hive.isBoxOpen(Constants.KHiveFavorite)) {
        await Hive.openBox<FavoriteModel>(Constants.KHiveFavorite);
        List<FavoriteModel> Data =
            await Hive.box<FavoriteModel>(Constants.KHiveFavorite)
                .values
                .toList();
        Get.back();
        emit(GetdataSuccess(FavoriteMovies: Data));
        Get.to(
            () => Favorite(
                  Data: Data.isEmpty ? [] : Data,
                ),
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 900));
      }
    } catch (e) {
      emit(GetdataFailure(failure: e.toString()));
    }
  }
}
