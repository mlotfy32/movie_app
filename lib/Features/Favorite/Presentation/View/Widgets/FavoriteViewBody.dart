import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/View/Widgets/favoriteContent.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';

class Favoriteviewbody extends StatefulWidget {
  const Favoriteviewbody({
    super.key,
  });

  @override
  State<Favoriteviewbody> createState() => _FavoriteviewbodyState();
}

class _FavoriteviewbodyState extends State<Favoriteviewbody> {
  @override
  Widget build(BuildContext context) {
    List newData = [];
    bool isEmpty = false;
    return BlocConsumer<GetdataCubit, GetdataState>(
      listener: (context, state) {
        if (state is GetdataLoading) {
          helper.CustomeDialog(AppStrings.loading, Appassetes.loading);
        } else if (state is GetdataSuccess) {
          newData.addAll(state.FavoriteMovies);
        } else {
          helper.CustomeDialog(
              AppStrings.faildtoGetData, Appassetes.failureDialog);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: newData == [] || newData.isEmpty
              ? Center(
                  child: Text(
                    AppStrings.emptyData,
                    style: Fontstyles.titleStyle,
                  ),
                )
              : BlocConsumer<RemoveFromFavoriteCubit, RemoveFromFavoriteState>(
                  listener: (context, state) {
                    if (state is RemoveFromFavoriteLoading) {
                      helper.CustomeDialog(
                          AppStrings.loading, Appassetes.loadingDialog);
                    } else if (state is RemoveFromFavoritSuccess) {
                      newData = state.Data;
                      isEmpty = state.isEmpty;
                      Get.back();

                      helper.CustomeDialog(AppStrings.removedsuccessfully,
                          Appassetes.successDialog);
                    }
                    if (state is RemoveFromFavoriteFailure) {
                      helper.CustomeDialog(
                          AppStrings.faildtoRemove, Appassetes.failureDialog);
                    }
                  },
                  builder: (context, state) {
                    return isEmpty == false
                        ? GridView.builder(
                            itemCount: newData.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return FavoriteContent(
                                favoriteModel: newData[index],
                              );
                            })
                        : Center(
                            child: Text(
                              AppStrings.emptyData,
                              style: Fontstyles.titleStyle,
                            ),
                          );
                  },
                ),
        );
      },
    );
  }

  @override
  void initState() {
    BlocProvider.of<GetdataCubit>(context).getFavorite();
    super.initState();
  }
}
