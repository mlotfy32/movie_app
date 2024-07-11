import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/detailes/Presentation/View/DetailesView.dart';

part 'checkiscontain_state.dart';

class CheckiscontainCubit extends Cubit<CheckiscontainState> {
  CheckiscontainCubit() : super(CheckiscontainInitial());
  Future isContain(int index, List Data) async {
    Box myBox;

    try {
      myBox = Hive.box(Constants.KBox);
      var HiveData = await myBox.get(Data[index].title);

      Get.to(
          duration: Duration(milliseconds: 900),
          () => Detailesview(
                id: Data[index].id,
                isContain: HiveData == null ? false : true,
                title: Data[index].title,
                Url: Data[index].poster_path,
                overView: Data[index].overview,
                release_date: Data[index].release_date,
                vote_average: Data[index].vote_average,
                vote_count: Data[index].vote_count,
              ),
          curve: Curves.bounceIn);
    } catch (e) {}
  }
}
